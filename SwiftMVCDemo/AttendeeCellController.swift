//
//  AttendeeCellController.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 21/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation

protocol AttendeeCellRepresentable{
    var name:String{ get }
    var company:String { get }
}

struct AttendeeCellController:AttendeeCellRepresentable{
    
    var name: String
    var company: String
    
    init(attendee:Attendee){
        self.name = attendee.name
        self.company = attendee.company
    }
    
}