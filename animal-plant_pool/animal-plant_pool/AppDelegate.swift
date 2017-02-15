//
//  AppDelegate.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/9.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //创建window,设置frame
        window = UIWindow(frame:UIScreen.main.bounds)
        //设置可见
        window?.makeKeyAndVisible()
        //设置根控制器
        let tabbarController = APPTabBarController()
        window?.rootViewController = tabbarController
        
        return true
    }



}

