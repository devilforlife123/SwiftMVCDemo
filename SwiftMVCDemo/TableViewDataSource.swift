//
//  TableViewDataSource.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 21/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

final class TableViewDataSource<Model,Cell:UITableViewCell where Cell:Reusable,Cell:CellConfigurable,Model == Cell.Controller>:NSObject,UITableViewDataSource{
    
    private unowned var tableView:UITableView
    
    var dataSource:[Model] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    init(tableView:UITableView){
        self.tableView = tableView
        tableView.registerReusableCell(Cell)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:Cell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.cellController = dataSource[indexPath.row]
        return cell 
    }
}