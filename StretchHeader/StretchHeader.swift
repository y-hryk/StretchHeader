//
//  StretchHeader.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/24.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

public class StretchHeader: UIView {
    
    public var imageView : UIImageView!
    private var contentSize = CGSizeZero
    private var topInset : CGFloat = 0
    private var options: StretchHeaderOptions!
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRectZero)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    private func commonInit() {
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.orangeColor()
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        imageView.userInteractionEnabled = true
        addSubview(imageView)
    }
    
    // MARK: Public
    public func stretchHeaderSize(headerSize headerSize: CGSize, imageSize: CGSize, controller: UIViewController, options: StretchHeaderOptions) {
        
        let status_height = UIApplication.sharedApplication().statusBarFrame.height
        let navi_height = controller.navigationController?.navigationBar.frame.size.height ?? 44
        
        self.options = options
        
        if options.position == StretchHeaderOptions.HeaderPosition.FullScreenTop {
            controller.automaticallyAdjustsScrollViewInsets = false
        }
        
        if options.position == StretchHeaderOptions.HeaderPosition.UnderNavigationBar {
            if let translucent = controller.navigationController?.navigationBar.translucent {
                if translucent {
                    topInset += status_height + navi_height
                }
            }
        }
        
        imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height)
        contentSize = imageSize
        self.frame = CGRectMake(0, 0, headerSize.width, headerSize.height)
    }
    
    public func updateScrollViewOffset(scrollView: UIScrollView) {
        
        if imageView == nil { return }
        var scrollOffset : CGFloat = scrollView.contentOffset.y
        scrollOffset += topInset
        
        if scrollOffset < 0 {
            imageView.frame = CGRectMake(scrollOffset ,scrollOffset, contentSize.width - (scrollOffset * 2) , contentSize.height - scrollOffset);
        } else {
            imageView.frame = CGRectMake(0, 0, contentSize.width, contentSize.height);
        }
    }
}
