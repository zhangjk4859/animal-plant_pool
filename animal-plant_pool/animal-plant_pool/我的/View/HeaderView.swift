//
//  HeaderView.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/15.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class HeaderView: UIView {

     var imageView:UIImageView?
        
     required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
        
    }
        
    
//    // Only override draw() if you perform custom drawing.
//    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        
//        //开启图片上下文
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        let ctx = UIGraphicsGetCurrentContext()
//        //绘制路径
//        let path = UIBezierPath()
//        //描述路径
//        path.addArcWithCenter(CGPoint(x: size.width * 0.5,y: size.height * 0.5), radius: size.height * 0.5, startAngle: 0.0, endAngle: CGFloat(M_PI) * 2, clockwise: false)
//        CGContextAddPath(ctx, path.CGPath)
//        CGContextClip(ctx)
//        self.drawAtPoint(CGPointZero)
//        let clipImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }
    

}
