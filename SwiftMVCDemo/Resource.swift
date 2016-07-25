//
//  Resource.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit


public struct Resource{
    let path:String
    let method:Method
    
}
public enum Method:String{
    
    case POST
    case GET
}

extension Resource{
    
    public func toRequest(baseURL:NSURL)->NSURLRequest{
        
        let components = NSURLComponents(URL: baseURL,resolvingAgainstBaseURL: false)
        components?.path = path
        
        let finalURL = components?.URL ?? baseURL
        let request = NSMutableURLRequest(URL:finalURL)
        
        request.HTTPMethod = method.rawValue
        return request 
    }
}