//
//  Mappable.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation

protocol Mappable{
    static func mapToModel(o:AnyObject)->Result<Self,Error> 
}


func parse<T:Mappable>(data:NSData,completion:Result<[T],Error>->()){
    
    let decodedObject = decodeObject(data)
    switch decodedObject{
    case .Success(let result):
        guard let array = result as? [AnyObject]else{
            completion(.Failure(.Parser))
            return
        }
        let result:Result<[T],Error> = arrayToModels(array)
        completion(result)
    case .Failure:
        completion(.Failure(.Parser))
    }
}

private func arrayToModels<T:Mappable>(objects:[AnyObject])->Result<[T],Error>{
    
    var array:[T] = []
    for object in objects{
        guard case .Success(let model) = T.mapToModel(object)else{
            continue
        }
        array.append(model)
    }
    
    return .Success(array)
}


private func decodeObject(data:NSData)->Result<AnyObject,Error>{
    do{
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
        return .Success(json)
    }catch{
        return .Failure(.Parser)
    }
}
