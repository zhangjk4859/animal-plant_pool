//
//  LoginVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/14.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    var backgroundImageView:UIImageView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首先添加一个imageView
        backgroundImageView = UIImageView(image: UIImage(named: "background"))
        view.addSubview(backgroundImageView!)
        view.backgroundColor = UIColor.white
        
        //添加三个按钮
        let width = view.width / 3
        let height = width + 30
        var names = ["手机登录","微信登录","QQ登录"]
        for index in 0 ..< 3 {
            let btn = JKVerticalButton.init(type: UIButtonType.custom)
            view.addSubview(btn)
            btn.frame = CGRect(x: CGFloat(Float(index)) * width, y: backgroundImageView!.frame.maxY, width: width, height: height)
            btn.backgroundColor = UIColor.blue
            btn.setTitle(names[index], for: UIControlState.normal)
            btn.setImage(UIImage(named:"release"), for: UIControlState.normal)
        }
        
        
        

    }


}
