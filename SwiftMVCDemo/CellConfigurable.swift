//
//  CellConfigurable.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 21/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

protocol CellConfigurable:class{
    associatedtype Controller
    var cellController:Controller? { get set }
}
