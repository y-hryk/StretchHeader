//
//  StretchHeader.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/24.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

open class StretchHeader: UIView {
    
    open var imageView : UIImageView!
    fileprivate var contentSize = CGSize.zero
    fileprivate var topInset : CGFloat = 0
    fileprivate var options: StretchHeaderOptions!
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private
    fileprivate func commonInit() {
        imageView = UIImageView()
        imageView.backgroundColor = UIColor.orange
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        addSubview(imageView)
    }
    
    // MARK: Public
    open func stretchHeaderSize(headerSize: CGSize, imageSize: CGSize, controller: UIViewController, options: StretchHeaderOptions) {
        
        let status_height = UIApplication.shared.statusBarFrame.height
        let navi_height = controller.navigationController?.navigationBar.frame.size.height ?? 44
        
        self.options = options
        
        if options.position == StretchHeaderOptions.HeaderPosition.fullScreenTop {
            controller.automaticallyAdjustsScrollViewInsets = false
        }
        
        if options.position == StretchHeaderOptions.HeaderPosition.underNavigationBar {
            if let translucent = controller.navigationController?.navigationBar.isTranslucent {
                if translucent {
                    topInset += status_height + navi_height
                }
            }
        }
        
        imageView.frame = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        contentSize = imageSize
        self.frame = CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height)
    }
    
    open func updateScrollViewOffset(_ scrollView: UIScrollView) {
        
        if imageView == nil { return }
        var scrollOffset : CGFloat = scrollView.contentOffset.y
        scrollOffset += topInset
        
        if scrollOffset < 0 {
            imageView.frame = CGRect(x: scrollOffset ,y: scrollOffset, width: contentSize.width - (scrollOffset * 2) , height: contentSize.height - scrollOffset);
        } else {
            imageView.frame = CGRect(x: 0, y: 0, width: contentSize.width, height: contentSize.height);
        }
    }
}
