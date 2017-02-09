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

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        tabBar.backgroundColor = UIColor.blue
        
        //开始设置四个子控制器
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
