//
//  LoginVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/14.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var backgroundImageView:UIImageView?
    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首先添加一个imageView
        
        backgroundImageView = UIImageView(image: UIImage(named: "background"))
        view.backgroundColor = UIColor.white
        //让图片滚动起来
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT * 0.5), style: UITableViewStyle.plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        self.tableView = tableView
        
        
        
        //添加三个按钮
        let width = view.width / 3
        let height = width + 30
        var names = ["手机登录","微信登录","QQ登录"]
        for index in 0 ..< 3 {
            let btn = JKVerticalButton.init(type: UIButtonType.custom)
            view.addSubview(btn)
            btn.frame = CGRect(x: CGFloat(Float(index)) * width, y: tableView.frame.maxY, width: width, height: height)
            btn.backgroundColor = UIColor.blue
            btn.setTitle(names[index], for: UIControlState.normal)
            btn.setImage(UIImage(named:"release"), for: UIControlState.normal)
        }
        
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        autoScroll()
    }
    
    //用UIView的动画进行滚动
    func autoScroll(){
        
        UIView.animate(withDuration: 10) { 
            self.tableView?.setContentOffset(CGPoint(x: 0, y: -2000), animated: false)
        }
        
        
    }


}

extension LoginVC{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
         if cell == nil {
           cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            
            let imageView = UIImageView(image: UIImage(named: "background"))
            cell?.addSubview(imageView)
//            cell?.textLabel?.text = "111"
        }
//        print(cell.)
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (backgroundImageView?.height)!
    }
}
