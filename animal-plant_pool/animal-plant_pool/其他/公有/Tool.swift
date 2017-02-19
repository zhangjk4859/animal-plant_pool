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
