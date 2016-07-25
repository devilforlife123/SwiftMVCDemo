//
//  AttendeeCell.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 21/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

extension AttendeeCell:Reusable{}
extension AttendeeCell:CellConfigurable{}

class AttendeeCell:UITableViewCell{
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .Subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var cellController: AttendeeCellController?{
        didSet{
            if let controller = cellController{
                self.textLabel?.text = controller.name
                self.detailTextLabel?.text = controller.company
            }
        }
    }
}