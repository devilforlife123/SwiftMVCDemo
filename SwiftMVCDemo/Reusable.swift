//
//  Reusable.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 21/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

protocol Reusable:class{
    static var reuseIdentifier:String { get }
}
extension Reusable{
    static var reuseIdentifier:String { return String(Self)}
}

extension UITableView{
    
    func dequeueReusableCell<T:UITableViewCell where T:Reusable>(indexPath indexPath:NSIndexPath)->T{
       return dequeueReusableCellWithIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T 
    }
    
    func registerReusableCell<T:UITableViewCell where T:Reusable>(_:T.Type){
        registerClass(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
