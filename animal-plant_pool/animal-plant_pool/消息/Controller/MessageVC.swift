//
//  MessageVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class MessageVC: UIViewController,UIScrollViewDelegate {
    var indicatorView:UIView?
    var scrollView:UIScrollView?
    var titleView:UIView?
    var selectedBtn:UIButton?
    var initialX:CGFloat?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.lightGray
        let titles = ["评论","点赞","消息"]
        //顶部的titleView,平均分为三份，高度为tabbar的49
        titleView = UIView(frame: CGRect(x: 0, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: TABBAR_HEIGHT))
        view.addSubview(titleView!)
        
        //添加底部scrollView
        scrollView = UIScrollView(frame: CGRect(x: 0, y: (titleView?.frame.maxY)!, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVBAR_HEIGHT - TABBAR_HEIGHT * 2))
        view.addSubview(scrollView!)
        scrollView?.isPagingEnabled = true
        scrollView?.bounces = false
        scrollView?.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(titles.count), height: (scrollView?.height)!)
        scrollView?.isScrollEnabled = true
        scrollView?.delegate = self
        
        //默认添加评论的tableView
        let commentVC = CommentTableVC(style: UITableViewStyle.plain)
        let likeVC = LikeTableVC(style: UITableViewStyle.plain)
        let messageVC = MessageTableVC(style: UITableViewStyle.plain)
        self.addChildViewController(commentVC)
        self.addChildViewController(likeVC)
        self.addChildViewController(messageVC)
        for index in 0..<self.childViewControllers.count {
            let vc:UIViewController = self.childViewControllers[index]
            vc.view.x = CGFloat(index) * (scrollView?.width)!
            vc.view.y = 0
            vc.view.width = (scrollView?.width)!
            vc.view.height = (scrollView?.height)!
            scrollView?.addSubview(vc.view)
        }
        //添加底部指示条
        let btnWidth = SCREEN_WIDTH / CGFloat(titles.count)
        let indicatorHeight : CGFloat = 3
        indicatorView = UIView(frame: CGRect(x: 0, y: TABBAR_HEIGHT - indicatorHeight, width: btnWidth, height: indicatorHeight))
        indicatorView?.backgroundColor = THEME_GREEN
        
        //开始添加三个按钮
        for index in 0..<titles.count {
            let btn = UIButton(frame: CGRect(x: CGFloat(index) * btnWidth , y: 0, width: btnWidth, height: TABBAR_HEIGHT))
            titleView?.addSubview(btn)
            btn.setTitle(titles[index], for: UIControlState.normal)
            btn.setTitleColor(THEME_GREEN, for: UIControlState.disabled)
            btn.setTitleColor(UIColor.black, for: UIControlState.normal)
            btn.addTarget(self, action:#selector(self.btnClick(_:)), for: UIControlEvents.touchUpInside)
            btn.titleLabel?.sizeToFit()
            //默认选中第一个按钮
            if index == 0 {
                btnClick(btn)
            }
        }
        
        //最后添加指示器
        titleView?.addSubview(indicatorView!)
        let btn = titleView?.subviews[0] as! UIButton
        indicatorView?.width = (btn.titleLabel?.width)!
        indicatorView?.center.x = btn.center.x
        //记录好初始的X距离，给didScroll用
        initialX = indicatorView?.center.x
        
    }
    
    //按钮点击事件
    func btnClick(_ btn:UIButton){
        //进来先把上一次的按钮激活
        selectedBtn?.isEnabled = true
        //点击按钮后，变为不可选
        btn.isEnabled = false
        //按钮保存状态
        selectedBtn = btn
        //同时让视图滚动
        let index = btn.x/btn.width
        scrollView?.setContentOffset(CGPoint(x: CGFloat(CGFloat(index) * SCREEN_WIDTH), y: CGFloat(0)), animated: true)
    }
    
    //抽出方法设置指示条边长变短的动画效果
    private func setIndicatorView(scrollView: UIScrollView)-> (UIButton){
        
        let index = Int(Float(scrollView.contentOffset.x)  / Float(scrollView.width))
        let btn = titleView?.subviews[index] as! UIButton
        UIView.animate(withDuration: 0.1) {
            self.indicatorView?.width = (btn.titleLabel?.width)!
            self.indicatorView?.center.x = btn.center.x
        }
        return btn
    }
    
    // MARK: - scrollView Delegate
    
    //按钮点击方法 setContentOffset 动画结束后调用的方法
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        setIndicatorView(scrollView: scrollView)
    }
    
    //下面两个方法顺序执行，有关联
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //让指示条跟随滚动 滚动视图的位移，除以三
        indicatorView?.center.x = initialX! + scrollView.width * ( scrollView.contentOffset.x / scrollView.contentSize.width)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        //设置动画效果
        let btn = setIndicatorView(scrollView: scrollView)
        //点击对应的按钮
        btnClick(btn)

    }
    
    
    
}
