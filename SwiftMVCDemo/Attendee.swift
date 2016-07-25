//
//  Attendee.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation

struct Attendee{
    let name:String
    let company:String
}

extension Attendee:Mappable{
    static func mapToModel(o: AnyObject) -> Result<Attendee, Error> {
        guard let dict = o as? [String:AnyObject],
            let name = dict["name"] as? String,
            let company = dict["company"] as? String else{
                return .Failure(.Parser)
        }
        return .Success(Attendee(name: name, company: company))
    }
}