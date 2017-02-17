//
//  ExperienceVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class ExperienceVC: UITableViewController {

    var wrapView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        //设置一个包裹View包住上下两个视图，然后设置给headerView
        let height:CGFloat = 330
        wrapView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: height))
        
        //设置bannerView
        let images = ["weather_overcast_day_big","weather_overcast_night_big",
                      "weather_rain_night_big","weather_overcast_day_big","weather_overcast_night_big",
                      "weather_rain_night_big"]
        
        let bannerView = BannerView(frame: CGRect(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: 200))
        wrapView.addSubview(bannerView)
        bannerView.images = images
        
        //添加apView
        let apView = AnimalPlantView(frame: CGRect(x: 0, y: bannerView.frame.maxY , width: view.width, height: height - bannerView.height))
        wrapView.addSubview(apView)
        
        //添加一个分隔线
        let lineView = UIView(frame: CGRect(x: 0, y: apView.frame.maxY, width: SCREEN_WIDTH, height: 10))
        wrapView.addSubview(lineView)
        lineView.backgroundColor = THEME_GRAY
        
    }
    
    // MARK:UITableViewDataSource
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return wrapView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 370
    }

}
