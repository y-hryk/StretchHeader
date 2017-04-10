//
//  Demo5Controller.swift
//  StretchHeaderDemo
//
//  Created by Smirnov Maxim on 10/04/2017.
//  Copyright © 2017 h.yamaguchi. All rights reserved.
//

import UIKit

class Demo5Controller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var header : StretchHeader!
    var tableView : UITableView!
    var navigationView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
        // back button
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 10, y: 20, width: 44, height: 44)
        button.setImage(UIImage(named: "navi_back_btn")?.withRenderingMode(.alwaysTemplate), for: UIControlState())
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(Demo3Controller.leftButtonAction), for: .touchUpInside)
        view.addSubview(button)
        
        // back button on navigation bar
        let backBtn = UIBarButtonItem()
        let image: UIImage? = UIImage(named: "navi_back_btn")
        backBtn.image = image
        backBtn.action = #selector(Demo3Controller.leftButtonAction)
        backBtn.target = self
        navigationItem.leftBarButtonItem = backBtn
        
        setupHeaderView()
        
    }
    
    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .fullScreenTop
        options.scrollUpdateMethod = .notification
        options.isNavigationViewAnimated = true
        
        header = Bundle.main.loadNibNamed("StretchView", owner: nil, options: nil)?.first as? StretchView
        
        header.setup(options: options, withController: self, andScrollView: tableView, navigationView: navigationController?.navigationBar)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        tableView.tableHeaderView = header
    }
    
    // MARK: - Selector
    func leftButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        cell.textLabel?.text = "index -- \((indexPath as NSIndexPath).row)"
        return cell
    }
}
