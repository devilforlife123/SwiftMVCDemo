//
//  WWDCAttendeesUIController.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

final class WWDCAttendeesUIController{
    
    private unowned var view:UIView
    private let loadingView:LoadingView
    private let tableViewDataSource:TableViewDataSource<AttendeeCellController,AttendeeCell>
    
    init(view:UIView,tableView:UITableView){
        self.view = view
        self.loadingView = LoadingView(frame: CGRect(origin: .zero,size: tableView.frame.size))
        self.tableViewDataSource  = TableViewDataSource<AttendeeCellController,AttendeeCell>(tableView:tableView)
        tableView.dataSource = self.tableViewDataSource
        update(state)   
    }
    
    var state: UIState = .Loading{
        willSet(newState){
            update(newState)
        }
    }
}

extension WWDCAttendeesUIController:WWDCAttendeesDelegate{
    
    func update(newState:UIState){
        switch(state,newState){
        case(.Loading,.Loading):loadingToLoading()
        case(.Loading,.Success(let attendees)):loadingToSuccess(attendees)
        default: fatalError("Not yet implemented \(state) to \(newState)")
        }
    }
    
    func loadingToLoading(){
        view.addSubview(loadingView)
        loadingView.frame = CGRect(origin: .zero,size: view.frame.size)
    }
    
    func loadingToSuccess(attendees:[Attendee]){
        loadingView.removeFromSuperview()
        tableViewDataSource.dataSource = attendees.map({AttendeeCellController(attendee: $0)})
    }
}