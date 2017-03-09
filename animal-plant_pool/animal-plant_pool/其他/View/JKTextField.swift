//
//  JKTextField.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/3/9.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class JKTextField: UITextField {

    var placeholderFontSize: CGFloat?
    override func draw(_ rect: CGRect) {
        if placeholderFontSize != nil{
            setValue(UIFont.systemFont(ofSize: placeholderFontSize!), forKeyPath: "_placeholderLabel.font")
        }
        
    }
}
