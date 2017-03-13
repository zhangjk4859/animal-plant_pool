//
//  Tool.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/16.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import Foundation
import UIKit



//RGB转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: 1.0)
}

func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) ->UIColor{
    return UIColor(red: r/225.0, green: g/225.0, blue: b/225.0, alpha: a)
}


//主题绿色
public let THEME_GREEN = RGB(r: 136, g: 242, b: 65)
public let THEME_GRAY = RGB(r: 210, g: 210, b: 210)
public let THEME_GREEN_HILIGHTED = RGBA(r: 136, g: 242, b: 65,a:0.5)
//灰色字体的颜色
public let GRAY_STRING = RGB(r: 157, g: 158, b: 159)


//设备屏幕尺寸
public let SCREEN_WIDTH = UIScreen.main.bounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
//导航栏高度
public let NAVBAR_HEIGHT : CGFloat = 64
//tabbar高度
public let TABBAR_HEIGHT : CGFloat = 49


//生成颜色的方法
func createImage(with color: UIColor) -> UIImage {
    // 1 * 1 的方框
    let rect = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: CGFloat(1.0), height: CGFloat(1.0))
    //开启画画功能
    UIGraphicsBeginImageContext(rect.size)
    //拿到画布
    let context: CGContext? = UIGraphicsGetCurrentContext()
    //指定颜色
    context?.setFillColor(color.cgColor)
    //指定画布尺寸
    context?.fill(rect)
    //让画布变成图片
    let theImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
    //关闭画画功能
    UIGraphicsEndImageContext()
    return theImage!
}

//判断手机号码正则表达式
func isMobile(phoneNumber:String) -> Bool{
    
    let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
    //移动
    let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
    //联通
    let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
    //电信
    let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
    let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
    let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
    let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
    let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
    if ((regextestmobile.evaluate(with: phoneNumber) == true)
        || (regextestcm.evaluate(with: phoneNumber)  == true)
        || (regextestct.evaluate(with: phoneNumber) == true)
        || (regextestcu.evaluate(with: phoneNumber) == true))
    {
        return true
    }
    else
    {
        return false
    }
}





/*********网络***********/
/*
//判断网络是否可用
public func NETWORK_AVILIABLE()->Bool{
    //
    let reachability:Reachability
    do{
        reachability=try reachability.reachabilityForInternetConnection()
        
        if (reachability.isReachable()){
            //
            print("network is available")
            return true
        }
        else{
            //
            print("network is not available")
            return false
        }
        
    }
    catch{
        //
        print("Unable to create Reachability")
        return false
    }
    
}
 */
