//
//  DairyVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class DairyVC: UIViewController {

    //图片背景
    var weatherView:UIImageView?
    //点击波纹图片
    var rippView:UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置基本功能
        setBasicFeathers()
        
        
        //天气模块
        weatherView = UIImageView(image: UIImage(named: "weather_sun_day_big"))
          //往下挪
        weatherView?.frame.origin.y += 64
        view.addSubview(weatherView!);
        let tap = UITapGestureRecognizer(target: self, action:#selector(self.tapView(_:)))
        weatherView?.addGestureRecognizer(tap)
        weatherView?.isUserInteractionEnabled = true
        
        
        
    }

    //点击图片效果
     func tapView(_ tap: UITapGestureRecognizer){
        
        //产生波纹
        let locationPoint = tap.location(in:weatherView)
        weatherView?.addSubview(rippView!)
        rippView?.center = locationPoint
        rippView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.1, animations: {
                            self.rippView?.alpha = 1
                        })
        UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.rippView?.transform = CGAffineTransform(scaleX: 1,y: 1);
            self.rippView?.alpha=0;
            
            }) { (Bool) in
            self.rippView?.removeFromSuperview()
        }
        
    }
    
    //设置固定功能
    private func setBasicFeathers(){
        //设置波纹图片
        rippView = UIView()
        rippView?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        rippView?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        rippView?.layer.cornerRadius = 150
        rippView?.layer.masksToBounds = true
        //设置导航栏右边图标
        let img = UIImage(named: "release")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let item = UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item
        //设置背景为白色
        view.backgroundColor = UIColor.white
    }
    
    
    //备用代码
    private func test(){
        //        //图片本身旋转
        //        let rotation = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        //        if self.weatherView?.transform == rotation{
        //
        //            UIView.animate(withDuration: 1, animations: {
        //                self.weatherView?.transform = CGAffineTransform.identity
        //            })
        //        }else{
        //            UIView.animate(withDuration: 1, animations: {
        //                self.weatherView?.transform = rotation
        //            })
        //        }
    }


}
