//
//  BannerView.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/17.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class BannerView: UIView,UIScrollViewDelegate {
    //公布一个图片数组
    var images:Array<String>?
    var timeInterval:TimeInterval?
    
    //添加定时器
    private var timer:Timer!
    //总页数
    private var pageCount:Int?
    //全局滚动视图
    private var bannerView:UIScrollView?
    //指示器
    private var indicator:UIPageControl?
    //存储当前页数
    private var currentPageIndex:Int?
    
    //设置了尺寸以后开始布置子视图
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        //有图片资源才能进行子视图分布
        if images != nil{
           
           pageCount = images?.count
           bannerView = UIScrollView(frame: CGRect(x: 0, y: 0, width:width, height:height))
            addSubview(bannerView!)
            bannerView?.isPagingEnabled = true
            bannerView?.contentSize = CGSize(width: width * CGFloat(pageCount!), height: height)
            bannerView?.showsVerticalScrollIndicator = false
            bannerView?.showsHorizontalScrollIndicator = false
            bannerView?.bounces = false
            bannerView?.delegate = self
            for index in 0..<pageCount!{
                let imageView = UIImageView(image: UIImage(named: (images?[index])!))
                imageView.contentMode = UIViewContentMode.scaleToFill
                imageView.x = CGFloat(index) * width
                imageView.y = 0
                imageView.width = width
                imageView.height = height
                bannerView?.addSubview(imageView)
            }
            
            //添加indicator
            let indicatorHeight:CGFloat = 20
            indicator = UIPageControl(frame: CGRect(x: 0, y: height - indicatorHeight, width: width, height: indicatorHeight))
            addSubview(indicator!)
            indicator?.pageIndicatorTintColor = UIColor.white
            indicator?.currentPageIndicatorTintColor = UIColor.red
            indicator?.numberOfPages = pageCount!
            indicator?.currentPage = 0
            
            //添加一个定时器 自己挂掉之前先放掉计时器的绳子
            timer = Timer(timeInterval: (timeInterval==nil ? 3 : timeInterval! ), target: self, selector: #selector(self.nextPage), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoopMode.defaultRunLoopMode)
            //从第一个开始
            currentPageIndex = 0
            
        }else{
            backgroundColor = UIColor.orange
            let textLabel = UILabel()
            textLabel.text = "没有可以展示的数据哦"
            textLabel.textColor = UIColor.black
            addSubview(textLabel)
            textLabel.frame.size = CGSize(width:width, height: 50)
            textLabel.textAlignment = NSTextAlignment.center
            textLabel.center.y = height * 0.5
           
        }
    }
    
    //定时器动作
    func nextPage(){
        //在这里做翻页动作
        currentPageIndex = currentPageIndex! + 1
        if currentPageIndex == pageCount!{
            currentPageIndex = 0
        }
        bannerView?.scrollRectToVisible(CGRect(x: CGFloat(currentPageIndex!) * (bannerView?.width)!, y: 0, width: (bannerView?.width)!, height: (bannerView?.height)!), animated: true)
    }

    
    // MARK:UIScrollView delegate
    //滚动后调用的方法,手动滚动
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //算出当前页
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        indicator?.currentPage = index
        currentPageIndex = index
    }
    
    //set设定到某个页调用的方法
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        indicator?.currentPage = index
    }
    
    deinit {
        timer.invalidate()
        timer = nil
    }
}
