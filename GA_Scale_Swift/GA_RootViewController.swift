//
//  GA_RootViewController.swift
//  GA_Scale_Swift
//
//  Created by houjianan on 16/1/31.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_RootViewController: UIViewController {
    
    @IBOutlet weak var rootTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("%@","d")
        print(NSLocalizedString("hello", comment: ""))
    }
    
    lazy var rootData: [[String : UnitsType]] = {
        return data.Units
    }()
    
}

extension GA_RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rootCell")
        cell?.textLabel?.text = rootData[indexPath.row].keys.first
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rootData.count
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 2
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let toVC = storyboard.instantiateViewControllerWithIdentifier("GA_WeightViewController") as! GA_WeightViewController
        toVC.mType = rootData[indexPath.row].values.first!
        self.navigationController?.pushViewController(toVC, animated: true)
        return indexPath
    }
}