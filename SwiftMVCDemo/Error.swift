//
//  Eror.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation

enum Error:ErrorType{
    case Network(String)
    case Parser
}
