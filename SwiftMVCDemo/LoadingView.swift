//
//  LoadingView.swift
//  SwiftMVCDemo
//
//  Created by suraj poudel on 20/07/2016.
//  Copyright © 2016 suraj poudel. All rights reserved.
//

import Foundation
import UIKit

final class LoadingView:UIView{
    
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    override init(frame: CGRect) {
        spinner.startAnimating()
        super.init(frame: frame)
        
        addSubview(spinner)
        backgroundColor = UIColor.whiteColor()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinner.center = center
    }


}
