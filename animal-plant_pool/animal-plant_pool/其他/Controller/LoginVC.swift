//
//  LoginVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/14.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class LoginVC: UIViewController{
    var backgroundImageView:UIImageView?
    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首先添加一个imageView
        
        backgroundImageView = UIImageView(image: UIImage(named: "background"))
        view.backgroundColor = UIColor.white
        view.addSubview(backgroundImageView!)
        //颜色渐变
        
        //添加三个按钮,宽度平分成六份
        let width = view.width / 6
        let height = width + 30
        var names = ["手机登录","微信登录","QQ登录"]
        var imageNames = ["login_mobile","login_weixin","login_QQ"]
        for index in 0 ..< 3 {
            let btn = JKVerticalButton.init(type: UIButtonType.custom)
            view.addSubview(btn)
            btn.frame = CGRect(x: CGFloat(Float(index)) * width * 2 + width * 0.5, y: backgroundImageView!.frame.maxY + width, width: width, height: height)
        
            btn.setTitle(names[index], for: UIControlState.normal)
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.setImage(UIImage(named:imageNames[index]), for: UIControlState.normal)
        }
        
        

    }


}


