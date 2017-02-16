//
//  APPTabBarController.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/9.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class APPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置字体颜色
        tabBar.tintColor = UIColor(red: 136/255, green: 242/255, blue: 65/255, alpha: 1.0)
        
        //开始设置四个子控制器
//        let loginVC = LoginVC()
//        let navLogin = customizingViewController(vc: loginVC, title: "测试", imageName: "icon_my", selectedImageName: "icon_my_HL")
//        addChildViewController(loginVC)
        
        
        let messageVC = MessageVC()
        let navMessage = customizingViewController(vc: messageVC, title: "消息", imageName: "icon_message", selectedImageName: "icon_message_HL")
        addChildViewController(navMessage)
        
        let dairyVC = DairyVC()
        let navDairy = customizingViewController(vc: dairyVC, title: "日记", imageName: "icon_diary", selectedImageName: "icon_diary_HL")
        addChildViewController(navDairy)
        
        
        let experienceVC = ExperienceVC()
        let navExperience = customizingViewController(vc: experienceVC, title: "经验", imageName: "icon_experience", selectedImageName: "icon_experience_HL")
        addChildViewController(navExperience)

        
        
        let mineVC = MineVC()
        let navMine = customizingViewController(vc: mineVC, title: "我的", imageName: "icon_my", selectedImageName: "icon_my_HL")
        addChildViewController(navMine)

        
        
        
        
    }

    //统一定制viewController的方法
    func customizingViewController(vc:UIViewController,title:String,imageName:String,selectedImageName:String)-> UIViewController
    {
        let nav = UINavigationController(rootViewController:vc)
        nav.tabBarItem = UITabBarItem(title:title,image:UIImage(named:imageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal),selectedImage:UIImage(named:selectedImageName)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        //设置导航标题
        nav.navigationBar.topItem?.title = "动植大池"
        return nav
    }

}
