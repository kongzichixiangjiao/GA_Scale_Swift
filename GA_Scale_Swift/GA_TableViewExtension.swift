//
//  GA_TableViewExtension.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/2/7.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

extension UITableView {
    
    func typeCount(type: UnitsType) -> Int {
        switch type  {
        case .weight:
            return data.weightUnits.count
        case .time:
            return data.timeUnits.count
        case .volume:
            return data.volumeUnits.count
        case .temperature:
            return data.temperatureUnits.count
        case .power:
            return data.powerUnits.count
        case .metric:
            return data.metricUnits.count
        case .length:
            return data.lengthUnits.count
        case .energy:
            return data.energyUnits.count
        case .area:
            return data.areaUnits.count
        case .angle:
            return data.angleUnits.count
            
        }
    }
}
