//
//  AnimalPlantView.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/10.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class AnimalPlantView: UIView {
    
     //布局子视图
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.white
        
        let viewWidth = self.width * 0.5
        
        //设置大小平分本view,两个空白子view
        let leftView = UIView(frame:CGRect(x: 0, y: 0, width: viewWidth, height: self.height))
          //添加图片
        let animalImageView = UIImageView(image: UIImage(named:"icon_animal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
          //添加名字
        let animalNameLable = UILabel(frame: CGRect(x: 0, y: 0, width: viewWidth, height: self.height))
        animalNameLable.text = "宠物"
        animalNameLable.center = animalImageView.center
        animalNameLable.textAlignment = NSTextAlignment.center
        animalNameLable.textColor = UIColor.white
        animalNameLable.shadowColor  = UIColor.lightGray
        animalNameLable.shadowOffset = CGSize(width: 2, height: 2)
        animalImageView.addSubview(animalNameLable)
        leftView.addSubview(animalImageView)
        animalImageView.center = leftView.center
        addSubview(leftView)
        
        let rightView = UIView(frame:CGRect(x: viewWidth, y: 0, width: viewWidth , height: self.height))
        let plantImageView = UIImageView(image: UIImage(named:"icon_plant")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))
        //添加名字
        let plantNameLable = UILabel()
        plantNameLable.text = "植物"
        plantNameLable.textAlignment = NSTextAlignment.center
        plantNameLable.textColor = UIColor.white
        plantNameLable.shadowColor  = UIColor.lightGray
        plantNameLable.shadowOffset = CGSize(width: 2, height: 2)
        plantImageView.addSubview(plantNameLable)
        plantNameLable.frame = plantImageView.bounds
        rightView.addSubview(plantImageView)
        plantImageView.center = leftView.center //这里注意，右边子视图中点采取的是左边母视图的中点
        addSubview(rightView)
        
    }
    
    
    
    
    

}
