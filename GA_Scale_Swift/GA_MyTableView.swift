//
//  GA_MyTableView.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/2/1.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_MyTableView: UITableView {
    
    override func drawRect(rect: CGRect) {
        let rectanglePath = UIBezierPath(roundedRect: rect, cornerRadius: 15)
        UIColor.orangeColor().setFill()
        rectanglePath.fill()
    }
    
}
