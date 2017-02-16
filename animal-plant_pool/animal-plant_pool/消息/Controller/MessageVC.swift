//
//  MessageVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class MessageVC: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        //顶部的titleView,平均分为三份，高度为tabbar的49
        let titleView :UIView = UIView(frame: CGRect(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: TABBAR_HEIGHT))
        view.addSubview(titleView)
        titleView.backgroundColor = UIColor.orange
        
        //开始添加三个按钮
        let titles = ["评论","点赞","消息"]
        let btnWidth = SCREEN_WIDTH / CGFloat(titles.count)
        for index in 0..<titles.count {
            let btn = UIButton(frame: CGRect(x: CGFloat(index) * btnWidth , y: 0, width: btnWidth, height: TABBAR_HEIGHT))
            titleView.addSubview(btn)
            btn.setTitle(titles[index], for: UIControlState.normal)
        }
        
        //添加底部指示条
        let indicatorHeight : CGFloat = 3
        
        let indicatorView = UIView(frame: CGRect(x: 0, y: TABBAR_HEIGHT - indicatorHeight, width: btnWidth, height: indicatorHeight))
        indicatorView.backgroundColor = THEME_GREEN
        titleView.addSubview(indicatorView)
        
        //添加底部scrollView
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: titleView.frame.maxY, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT * 2))
        view.addSubview(scrollView)
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(titles.count), height: scrollView.height)
        scrollView.isScrollEnabled = true
        scrollView.delegate = self
        
        //默认添加评论的tableView
        let commentVC = CommentTableVC(style: UITableViewStyle.plain)
        let likeVC = LikeTableVC(style: UITableViewStyle.plain)
        let messageVC = MessageTableVC(style: UITableViewStyle.plain)
        self.addChildViewController(commentVC)
        self.addChildViewController(likeVC)
        self.addChildViewController(messageVC)
        for index in 0..<self.childViewControllers.count {
            let vc:UIViewController = self.childViewControllers[index]
            vc.view.x = CGFloat(index) * scrollView.width
            vc.view.y = 0
            vc.view.width = scrollView.width
            vc.view.height = scrollView.height
            scrollView.addSubview(vc.view)
        }
        
    
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating")
    }
    
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("scrollViewDidEndScrollingAnimation")
    }
    

    

}
