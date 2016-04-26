//
//  StretchHeaderOptions.swift
//  StretchHeaderDemo
//
//  Created by yamaguchi on 2016/03/24.
//  Copyright © 2016年 h.yamaguchi. All rights reserved.
//

import UIKit

public enum HeaderPosition {
    case FullScreenTop
    case UnderNavigationBar
}

public class StretchHeaderOptions {
    
    public var position : HeaderPosition = .FullScreenTop
}
