//
//  WWDCViewController.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

final class WWDCAttendeesViewController:UIViewController{
    
    private let attendeesHandler:WWDCAttendeesHandler
    private let tableView = UITableView(frame: .zero)
    private var attendeesUIController:WWDCAttendeesUIController!
    
    init(attendeesHandler:WWDCAttendeesHandler){
        self.attendeesHandler = attendeesHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        
        title = NSLocalizedString("wwdc_attendees", comment: "")
        
        attendeesUIController = WWDCAttendeesUIController(view: view, tableView: tableView)
        //Now let the handler set the delegate as the attendeesUIController
        //attendeesHandler which is WWDCAttendeesController 
        attendeesHandler.delegate = attendeesUIController
        attendeesHandler.fetchAttendees()
        
    }
}