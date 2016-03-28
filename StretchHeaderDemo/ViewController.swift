//
//  ViewController.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/24.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var datas = [String]()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        datas = ["Demo1 -- FullScreen","Demo2 -- NavigationBar","Demo3 -- Custom"]
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
        
        if indexPath.row == 0 { // DEMO 1
            let vc = Demo1Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 1 { // DEMO 2
            let vc = Demo2Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 2 { // DEMO 3
            let vc = Demo3Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
     }
}

