//
//  UIButton+Category.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/3/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Foundation
import UIKit


typealias ActionBlock = () -> Void
var overviewKey = CChar()

extension UIButton{
    
    //绑定blcok和按钮
   @objc func handldControlEvent(controlEvent:UIControlEvents,actionBlock:ActionBlock){
        objc_setAssociatedObject(self, &overviewKey, actionBlock, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    self.addTarget(self, action: #selector(callActionBlock(_:)), for: controlEvent)
    }
    
    //调用block
    func callActionBlock(_ sender:Any){
        let blcok:ActionBlock = objc_getAssociatedObject(self, &overviewKey) as! ActionBlock
        blcok()
    }
}
