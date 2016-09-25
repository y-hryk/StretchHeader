//
//  StretchHeaderOptions.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/24.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

open class StretchHeaderOptions {
    
    open var position : HeaderPosition = .fullScreenTop
    
    public enum HeaderPosition {
        case fullScreenTop
        case underNavigationBar
    }
    
    public init() {}
}
