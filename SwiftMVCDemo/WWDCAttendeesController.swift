//
//  WWDCAttendeesHandler.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import UIKit
import Foundation

enum UIState{
    case Loading
    case Success([Attendee])
    case Failure(Error)
}

protocol WWDCAttendeesDelegate:class{
    var state:UIState { get set}
}

protocol WWDCAttendeesHandler:class{
    
    var delegate:WWDCAttendeesDelegate?{ get set}
    func fetchAttendees()
}

final class WWDCAttendeesController:WWDCAttendeesHandler{
    
    let connectable:Connectable
    
    var delegate: WWDCAttendeesDelegate?
    
    typealias ParseCompletion = Result<[Attendee],Error>->()
    typealias NetworkCompletion = Result<NSData,Error>->()
    
    
    init(connectable:Connectable){
        self.connectable = connectable 
    }
    
    func fetchAttendees() {
        guard let delegate = self.delegate else {
            fatalError("The delegate is not set!!")
        }
        
        delegate.state = .Loading
        
        let resource = Resource(path: "/u/14102938/attendees.json", method: .GET)
        
        let parsingCompletion = createParseCompletion(delegate)
        let networkingCompletion = createNetworkCompletion(delegate,parseCompletion:parsingCompletion)
        connectable.makeConnection(resource, completion: networkingCompletion)
    }
    
    private func createParseCompletion(delegate:WWDCAttendeesDelegate)->ParseCompletion{
        return {
            attendeesResult in
            dispatch_async(dispatch_get_main_queue(), { 
                switch attendeesResult{
                case .Success(let attendee):delegate.state = .Success(attendee)
                case .Failure(let error):delegate.state = .Failure(error)
                }
            })
        }
    }
    
    private func createNetworkCompletion(delegate:WWDCAttendeesDelegate,parseCompletion:ParseCompletion)->NetworkCompletion{
        return {
            dataResult in
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), { 
                switch dataResult{
                case .Success(let data):parse(data,completion:parseCompletion)
                case .Failure(let error):delegate.state = .Failure(error)
                }
            })
        }
        
    }
    
    
}