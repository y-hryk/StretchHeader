//
//  StretchView.swift
//  StretchHeaderDemo
//
//  Created by Smirnov Maxim on 10/04/2017.
//  Copyright © 2017 h.yamaguchi. All rights reserved.
//

import UIKit

class StretchView: StretchHeader {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarImage.image = UIImage(named: "photo_sample_03")
        avatarImage.layer.cornerRadius = 5.0
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.layer.borderWidth = 3.0
        avatarImage.clipsToBounds = true
        avatarImage.contentMode = .scaleAspectFill
        
        button.setTitle("Edit Profile", for: UIControl.State())
        button.setTitleColor(UIColor.lightGray, for: UIControl.State())
        button.layer.cornerRadius = 5.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1.0
        
        setup(headerSize: CGSize(width: frame.size.width, height: 160), imageSize: CGSize(width: frame.size.width, height: 120))
        
    }
    
}
