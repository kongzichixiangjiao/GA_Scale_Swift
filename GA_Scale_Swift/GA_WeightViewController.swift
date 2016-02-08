//
//  ViewController.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/1/31.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_WeightViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var weightTableView: UITableView!
    @IBOutlet weak var selectedButton: UIBarButtonItem!
    
    var unitView: GA_UnitTableView!
    var mType: UnitsType = .weight
    var row: Int = 0
    
    lazy var weightData: [Weight] = {
        return [Weight(value: 1314, unit: WeightUnit.decigram)]
    }()
    
    lazy var timeData: [Time] = {
        return [Time(value: 1314, unit: .minute)]
    }()
    
    lazy var volumeData: [Volume] = {
        return [Volume(value: 1314, unit: .liter)]
    }()
    
    lazy var temperatureData: [Temperature] = {
        return [Temperature(value: 1314, unit: .kelvin)]
    }()
    
    lazy var powerData: [Power] = {
        return [Power(value: 1314, unit: .milliwatt)]
    }()
    
    lazy var metricData: [Metric] = {
        return [Metric(value: 1314, unit: .nano)]
    }()
    
    lazy var lengthData: [Length] = {
        return [Length(value: 1314, unit: .millimeter)]
    }()
    
    lazy var energyData: [Energy] = {
        return [Energy(value: 1314, unit: .joule)]
    }()
    
    lazy var areaData: [Area] = {
        return [Area(value: 1314, unit: .squareFoot)]
    }()
    
    lazy var angleData: [Angle] = {
        return [Angle(value: 1314, unit: .degree)]
    }()
    
    lazy var selectedHandler: GA_UnitTableView.SelectedHandler = {
        [weak self] str, row, type in
        if let weakSelf = self {
            weakSelf.row = row
            weakSelf.selectedButton.title = str
            if let d = Double(weakSelf.textField.text!) {
                switch type  {
                case .weight:
                    let weight = weakSelf.weightData.first
                    weakSelf.weightData = [Weight(value: d, unit: data.weightUnits[row])]
                    break
                case .time:
                    weakSelf.timeData = [Time(value: d, unit: data.timeUnits[row])]
                    break
                case .volume:
                    weakSelf.volumeData = [Volume(value: d, unit: data.volumeUnits[row])]
                    break
                case .temperature:
                    weakSelf.temperatureData = [Temperature(value: d, unit: data.temperatureUnits[row])]
                    break
                case .power:
                    weakSelf.powerData = [Power(value: d, unit: data.powerUnits[row])]
                    break
                case .metric:
                    weakSelf.metricData = [Metric(value: d, unit: data.metricUnits[row])]
                    break
                case .length:
                    weakSelf.lengthData = [Length(value: d, unit: data.lengthUnits[row])]
                    break
                case .energy:
                    weakSelf.energyData = [Energy(value: d, unit: data.energyUnits[row])]
                    break
                case .area:
                    weakSelf.areaData = [Area(value: d, unit: data.areaUnits[row])]
                    break
                case .angle:
                    weakSelf.angleData = [Angle(value: d, unit: data.angleUnits[row])]
                    break
                }
                weakSelf.weightTableView.reloadData()
            }
        }
    }
    
    @IBAction func selectedButtonAction(sender: UIBarButtonItem) {
        textField.resignFirstResponder()
        GA_UnitTableView.sharedInstance.show(view.frame, view: view, handler: selectedHandler, type: mType)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weight = Weight(value: 12, unit: WeightUnit.carat)
        print(weight.value)
        print(weight.to(unit: WeightUnit.gram))
        print(self.navigationController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension GA_WeightViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let d = Double(textField.text!) {
            
            switch mType  {
            case .weight:
                weightData = [Weight(value: d, unit: data.weightUnits[row])]
                selectedButton.title = String(data.weightUnits[row])
                break
            case .time:
                timeData = [Time(value: d, unit: data.timeUnits[row])]
                selectedButton.title = String(data.timeUnits[row])
                break
            case .volume:
                volumeData = [Volume(value: d, unit: data.volumeUnits[row])]
                selectedButton.title = String(data.volumeUnits[row])
                break
            case .temperature:
                temperatureData = [Temperature(value: d, unit: data.temperatureUnits[row])]
                selectedButton.title = String(data.volumeUnits[row])
                break
            case .power:
                powerData = [Power(value: d, unit: data.powerUnits[row])]
                selectedButton.title = String(data.powerUnits[row])
                break
            case .metric:
                metricData = [Metric(value: d, unit: data.metricUnits[row])]
                selectedButton.title = String(data.metricUnits[row])
                break
            case .length:
                lengthData = [Length(value: d, unit: data.lengthUnits[row])]
                selectedButton.title = String(data.lengthUnits[row])
                break
            case .energy:
                energyData = [Energy(value: d, unit: data.energyUnits[row])]
                selectedButton.title = String(data.energyUnits[row])
                break
            case .area:
                areaData = [Area(value: d, unit: data.areaUnits[row])]
                selectedButton.title = String(data.areaUnits[row])
                break
            case .angle:
                angleData = [Angle(value: d, unit: data.angleUnits[row])]
                selectedButton.title = String(data.angleUnits[row])
                break
            }
            textField.resignFirstResponder()
            weightTableView.reloadData()
        } else {
            textField.text = ""
        }
        return true
    }
}

extension GA_WeightViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        textField.resignFirstResponder()
    }
}

extension GA_WeightViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("weightCell")
        cell?.contentView.backgroundColor = UIColor.brownColor()
        let label = cell?.viewWithTag(-1) as! UILabel
        switch mType  {
        case .weight:
            let weight = weightData.first
            label.text = String(weight!.to(unit: data.weightUnits[indexPath.row]).value) + String(data.weightUnitsString[indexPath.row])
            break
        case .time:
            let time = timeData.first
            label.text = String(time!.to(unit: data.timeUnits[indexPath.row]).value) + String(data.timeUnitsString[indexPath.row])
            break
        case .volume:
            let volume = volumeData.first
            label.text = String(volume!.to(unit: data.volumeUnits[indexPath.row]).value) + String(data.volumeUnitsString[indexPath.row])
            break
        case .temperature:
            let temperature = temperatureData.first
            label.text = String(temperature!.to(unit: data.temperatureUnits[indexPath.row]).value) + String(data.temperatureUnitsString[indexPath.row])
            break
        case .power:
            let power = powerData.first
            label.text = String(power!.to(unit: data.powerUnits[indexPath.row]).value) + String(data.powerUnitsString[indexPath.row])
            break
        case .metric:
            let metric = metricData.first
            label.text = String(metric!.to(unit: data.metricUnits[indexPath.row]).value) + String(data.metricUnitsString[indexPath.row])
            break
        case .length:
            let length = lengthData.first
            label.text = String(length!.to(unit: data.lengthUnits[indexPath.row]).value) + String(data.lengthUnitsString[indexPath.row])
            break
        case .energy:
            let energy = energyData.first
            label.text = String(energy!.to(unit: data.energyUnits[indexPath.row]).value) + String(data.energyUnitsString[indexPath.row])
            break
        case .area:
            let area = areaData.first
            label.text = String(area!.to(unit: data.areaUnits[indexPath.row]).value) + String(data.areaUnitsString[indexPath.row])
            break
        case .angle:
            let angle = angleData.first
            label.text = String(angle!.to(unit: data.angleUnits[indexPath.row]).value) + String(data.angleUnitsString[indexPath.row])
            break
            
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView.typeCount(mType)
    }
    
}





