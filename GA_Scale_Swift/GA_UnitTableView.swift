//
//  GA_UnitTbaleView.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/1/31.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

private let v = GA_UnitTableView()

class GA_UnitTableView: UIView {
    
    var tableView: GA_MyTableView!
    private let CELL = "GA_UnitCell"
    
    var mType: UnitsType = .weight
    var mData: [AnyObject] = []
    
    typealias SelectedHandler = (str: String, row: Int, type: UnitsType) -> ()
    var selectedHandler: SelectedHandler!
    
    class var sharedInstance: GA_UnitTableView {
        return v
    }
    
    func show(frame: CGRect, view: UIView, data: [AnyObject] = ["2", "3"], handler: SelectedHandler, type: UnitsType) {
        view.addSubview(self)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.frame = view.frame
        self.selectedHandler = handler
        self.mType = type
        
        buildView(frame)
        refreshData(data, type: type)
    }
    
    func buildView(frame: CGRect) {
        let w: CGFloat = frame.size.width * 0.6
        let h: CGFloat = frame.size.width * 0.6
        let x = self.center.x - w / 2
        let y = self.center.y - h / 2
        
        tableView = GA_MyTableView(frame: CGRectMake(x, y, w, h))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: CELL, bundle: nil), forCellReuseIdentifier: CELL)
        tableView.backgroundColor = UIColor.clearColor()
        self.addSubview(tableView)
    }
    
    func refreshData(data: [AnyObject], type: UnitsType) {
        tableView.reloadData()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.removeFromSuperview()
    }
    
}

extension GA_UnitTableView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL) as! GA_UnitCell
        let label = cell.viewWithTag(-1) as! UILabel
        switch mType  {
        case .weight:
            label.text = String(data.weightUnitsString[indexPath.row])
            break
        case .time:
            label.text = String(data.timeUnitsString[indexPath.row])
            break
        case .volume:
            label.text = String(data.volumeUnitsString[indexPath.row])
            break
        case .temperature:
            label.text = String(data.temperatureUnitsString[indexPath.row])
            break
        case .power:
            label.text = String(data.powerUnitsString[indexPath.row])
            break
        case .metric:
            label.text = String(data.metricUnitsString[indexPath.row])
            break
        case .length:
            label.text = String(data.lengthUnitsString[indexPath.row])
            break
        case .energy:
            label.text = String(data.energyUnitsString[indexPath.row])
            break
        case .area:
            label.text = String(data.areaUnitsString[indexPath.row])
            break
        case .angle:
            label.text = String(data.angleUnitsString[indexPath.row])
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.typeCount(mType)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 36
    }
    
    func typeSelected(type: UnitsType, handler: SelectedHandler, row: Int) {
        switch type  {
        case .weight:
            handler(str: String(data.weightUnits[row]), row: row, type: mType)
        case .time:
            handler(str: String(data.timeUnits[row]), row: row, type: mType)
            break
        case .volume:
            handler(str: String(data.volumeUnits[row]), row: row, type: mType)
            break
        case .temperature:
            handler(str: String(data.temperatureUnits[row]), row: row, type: mType)
            break
        case .power:
            handler(str: String(data.powerUnits[row]), row: row, type: mType)
            break
        case .metric:
            handler(str: String(data.metricUnits[row]), row: row, type: mType)
            break
        case .length:
            handler(str: String(data.lengthUnits[row]), row: row, type: mType)
            break
        case .energy:
            handler(str: String(data.energyUnits[row]), row: row, type: mType)
            break
        case .area:
            handler(str: String(data.areaUnits[row]), row: row, type: mType)
            break
        case .angle:
            handler(str: String(data.angleUnits[row]), row: row, type: mType)
            break
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        typeSelected(mType, handler: selectedHandler, row: indexPath.row)
        self.removeFromSuperview()
    }
    
}