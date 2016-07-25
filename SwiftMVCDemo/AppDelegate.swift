//
//  AppDelegate.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window:UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        let attendeesViewController = WWDCAttendeesViewController(attendeesHandler: createController())
        let navigationController = UINavigationController(rootViewController: attendeesViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true 
    }
    
    func createController()->WWDCAttendeesController{
        
        let connection = Connection(baseURL: NSURL(string: "https://dl.dropboxusercontent.com")!)
        let attendeesController = WWDCAttendeesController(connectable: connection)
        return attendeesController
    }
}

