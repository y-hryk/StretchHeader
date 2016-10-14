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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        setupHeaderView()
    }
    
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .underNavigationBar
        
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSize(width: view.frame.size.width, height: 220),
            imageSize: CGSize(width: view.frame.size.width, height: 220),
            controller: self,
            options: options)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        // custom
        let label = UILabel()
        label.frame = CGRect(x: 10, y: header.frame.size.height - 40, width: header.frame.size.width - 20, height: 40)
        label.textColor = UIColor.white
        label.text = "StrechHeader Demo"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        header.addSubview(label)
        
        tableView.tableHeaderView = header
    }
    
    // MARK: - ScrollView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = "index -- \((indexPath as NSIndexPath).row)"
        return cell
    }
}
