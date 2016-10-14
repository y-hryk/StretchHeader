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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        datas = ["Demo1 -- FullScreen","Demo2 -- NavigationBar","Demo3 -- Custom"]
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = datas[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        
        if (indexPath as NSIndexPath).row == 0 { // DEMO 1
            let vc = Demo1Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if (indexPath as NSIndexPath).row == 1 { // DEMO 2
            let vc = Demo2Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if (indexPath as NSIndexPath).row == 2 { // DEMO 3
            let vc = Demo3Controller()
            self.navigationController?.pushViewController(vc, animated: true)
        }
     }
}

