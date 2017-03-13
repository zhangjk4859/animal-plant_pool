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
    
    
    //设置placeHolderLabel垂直居中
    override func layoutSubviews() {
        super.layoutSubviews()
         setValue(self.bounds.size.height, forKeyPath: "_placeholderLabel.height")
    }
    
    //调整rightView的位置
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= 10
        return textRect
    }
}
