//
//  Demo3Controller.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/28.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

class Demo3Controller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var header : StretchHeader!
    var tableView : UITableView!
    var navigationView = UIView()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        setupHeaderView()
        
        // NavigationHeader
        let navibarHeight : CGFloat = CGRectGetHeight(navigationController!.navigationBar.bounds)
        let statusbarHeight : CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        navigationView = UIView()
        navigationView.frame = CGRectMake(0, 0, view.frame.size.width, navibarHeight + statusbarHeight)
        navigationView.backgroundColor = UIColor(red: 121/255.0, green: 193/255.0, blue: 203/255.0, alpha: 1.0)
        navigationView.alpha = 0.0
        view.addSubview(navigationView)
        
        // back button
        let button = UIButton(type: .Custom)
        button.frame = CGRectMake(10, 20, 44, 44)
        button.setImage(UIImage(named: "navi_back_btn")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        button.tintColor = UIColor.whiteColor()
        button.addTarget(self, action: "leftButtonAction", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }

    func setupHeaderView() {
        
        let options = StretchHeaderOptions()
        options.position = .FullScreenTop
        
        header = StretchHeader()
        header.stretchHeaderSize(headerSize: CGSizeMake(view.frame.size.width, 160),
            imageSize: CGSizeMake(view.frame.size.width, 120),
            controller: self,
            options: options)
        header.imageView.image = UIImage(named: "photo_sample_05")
        
        // custom
        let avatarImage = UIImageView()
        avatarImage.frame = CGRectMake(10, header.imageView.frame.height - 20, 60, 60)
        avatarImage.image = UIImage(named: "photo_sample_03")
        avatarImage.layer.cornerRadius = 5.0
        avatarImage.layer.borderColor = UIColor.whiteColor().CGColor
        avatarImage.layer.borderWidth = 3.0
        avatarImage.clipsToBounds = true
        avatarImage.contentMode = .ScaleAspectFill
        header.addSubview(avatarImage)
        
        let button = UIButton(type: .RoundedRect)
        button.frame = CGRectMake(header.imageView.frame.width - 100 - 10, header.imageView.frame.height + 10, 100, 30)
        button.setTitle("Edit Profile", forState: .Normal)
        button.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.lightGrayColor().CGColor
        button.layer.borderWidth = 1.0
        header.addSubview(button)
        
        tableView.tableHeaderView = header
    }
    
    // MARK: - Selector
    func leftButtonAction() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - ScrollView Delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        header.updateScrollViewOffset(scrollView)
        
        // NavigationHeader alpha update
        let offset : CGFloat = scrollView.contentOffset.y
        if (offset > 50) {
            let alpha : CGFloat = min(CGFloat(1), CGFloat(1) - (CGFloat(50) + (navigationView.frame.height) - offset) / (navigationView.frame.height))
            navigationView.alpha = CGFloat(alpha)
            
        } else {
            navigationView.alpha = 0.0;
        }
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = "index -- \(indexPath.row)"
        return cell
    }
}


