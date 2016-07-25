//
//  Connection.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation

protocol Connectable{
    
    func makeConnection(resource:Resource,completion:Result<NSData,Error>->())
}

final class Connection:Connectable{
    
    private let baseURL:NSURL
    private let session:NSURLSession
    
    init(baseURL:NSURL,session:NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())){
        self.baseURL = baseURL
        self.session = session
    }
    
    func makeConnection(resource: Resource, completion: Result<NSData, Error> -> ()) {
        let urlRequest = resource.toRequest(self.baseURL)
        session.dataTaskWithRequest(urlRequest) { (data, response,error) in
            switch(data,error){
            case(let data?,_):completion(.Success(data))
            case(_,let error?):completion(.Failure(.Network(error.localizedDescription)))
            default:
                break
            }
        }.resume()
    }
    
    
}