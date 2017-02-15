//
//  JKVerticalButton.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/15.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class JKVerticalButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        //调整图片和标题的位置为上下排列
        imageView?.frame = CGRect(x: 0, y: 0, width: self.width, height: self.width)
        titleLabel?.frame = CGRect(x: 0, y: self.width, width: self.width, height: self.height - self.width)
        titleLabel?.textAlignment = NSTextAlignment.center
    }

}
