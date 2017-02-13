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
    //宠物和植物日记本图标
    var apView:AnimalPlantView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置基础视图
        setBasicFeathers()
        
        //设置天气图片
        weatherView = setWeatherView(imageName:"weather_sun_day_small")
        var viewFrame = weatherView?.frame
        viewFrame?.size.width -= 60
        viewFrame?.origin.x += 30
        weatherView?.frame = viewFrame!
        let height = weatherView?.frame.height
        weatherView?.layer.cornerRadius = height! * 0.5
        weatherView?.layer.masksToBounds = true
        view.addSubview(weatherView!);
        
        //放动物和植物标签，一个view包裹两个imageView
        apView = AnimalPlantView(frame: CGRect(x: 0, y: (weatherView?.frame)!.maxY , width: view.width, height: 130))
        view.addSubview(apView!)
      
    }
    
    //点击图片效果
     func tapView(_ tap: UITapGestureRecognizer){
        
        //产生波纹
        circleAffect(tap: tap)
        
        //动画放大原理分两步
          //第一，取消圆形切割，放大宽度
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            var viewFrame = self.weatherView?.frame
            viewFrame?.size.width = UIScreen.main.bounds.width
            viewFrame?.origin.x = 0
            self.weatherView?.frame = viewFrame!
            self.weatherView?.layer.cornerRadius = 0
            self.weatherView?.layer.masksToBounds = false

            
            }) { (Bool) in  // 第一次动画完成后
                
                //更换大图片，往下挪
                self.weatherView = self.setWeatherView(imageName: "weather_sun_day_big")
                var viewFrame = self.weatherView?.frame
                viewFrame?.origin.y = (viewFrame?.origin.y)! - (UIScreen.main.bounds.height * 0.5 - (viewFrame?.size.height)!)
                viewFrame?.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.5)
                self.weatherView?.frame = viewFrame!
                
                //动画开始往下挪
                UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                    viewFrame?.origin.y = 64
                    self.weatherView?.frame = viewFrame!
                    self.apView?.y = (self.weatherView?.frame)!.maxY
                }) { (Bool) in
                    
                }
        }
        
    }
    
    //设置天气图片
    private func setWeatherView(imageName:String)->UIImageView{
        
        if weatherView == nil {
            weatherView = UIImageView(image: UIImage(named:imageName))
            //往下挪
            weatherView?.frame.origin.y += 64
            let tap = UITapGestureRecognizer(target: self, action:#selector(self.tapView(_:)))
            weatherView?.addGestureRecognizer(tap)
            weatherView?.isUserInteractionEnabled = true
        }else{
            weatherView?.image = UIImage(named: imageName)
        }
        return weatherView!
    }
    
    //产生波纹的动画效果
    private func circleAffect(tap: UITapGestureRecognizer){
        let locationPoint = tap.location(in:weatherView)
        weatherView?.addSubview(rippView!)
        rippView?.center = locationPoint
        rippView?.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.1, animations: {
            self.rippView?.alpha = 0.5
        })
        UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            
            self.rippView?.transform = CGAffineTransform(scaleX: 1,y: 1);
            self.rippView?.alpha=0;
            
        }) { (Bool) in
            self.rippView?.removeFromSuperview()
        }
    }
    
    //设置基础视图
    private func setBasicFeathers(){
        //设置波纹图片
        rippView = UIView()
        rippView?.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        rippView?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        rippView?.layer.cornerRadius = 100
        rippView?.layer.masksToBounds = true
        //设置导航栏右边图标
        let img = UIImage(named: "release")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        let item = UIBarButtonItem(image: img, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = item
        //设置背景为白色
        view.backgroundColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1.0)
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
