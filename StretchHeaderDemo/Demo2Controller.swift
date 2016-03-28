//
//  Demo2Controller.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/27.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class Demo2Controller: UITableViewController {

    var header : StretchHeader!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        setupHeaderView()
    }
    
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .UnderNavigationBar
        
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSizeMake(view.frame.size.width, 220),
            imageSize: CGSizeMake(view.frame.size.width, 220),
            controller: self,
            options: options)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        // custom
        let label = UILabel()
        label.frame = CGRectMake(10, header.frame.size.height - 40, header.frame.size.width - 20, 40)
        label.textColor = UIColor.whiteColor()
        label.text = "StrechHeader Demo"
        label.font = UIFont.boldSystemFontOfSize(16)
        header.addSubview(label)
        
        tableView.tableHeaderView = header
    }
    
    // MAEK: - ScrollView Delegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = "index -- \(indexPath.row)"
        return cell
    }
}
