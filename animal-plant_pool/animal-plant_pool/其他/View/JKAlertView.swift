//
//  JKAlertView.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/22.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class JKAlertView: UIView {
    
    class func showMessage(_ message: String, duration time: TimeInterval) {
        let screenSize: CGSize = UIScreen.main.bounds.size
        let window: UIWindow? = UIApplication.shared.keyWindow
        let showview = UIView()
        showview.backgroundColor = UIColor.gray
        showview.alpha = 1.0
        showview.layer.cornerRadius = 5.0
        showview.layer.masksToBounds = true
        window?.addSubview(showview)
        let label = UILabel()
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping
        let attributes:[String: Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: CGFloat(15.0)), NSParagraphStyleAttributeName: paragraphStyle]
        let labelSize = message.boundingRect(with: CGSize(width: CGFloat(207), height: CGFloat(999)), options: .usesLineFragmentOrigin, attributes: attributes, context: nil).size
        
        label.frame = CGRect(x: CGFloat(10), y: CGFloat(5), width: CGFloat(labelSize.width + 20), height: CGFloat(labelSize.height))
        label.text = message
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment(rawValue: 1)!
        label.backgroundColor = UIColor.clear
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(15))
        showview.addSubview(label)
        showview.frame = CGRect(x: CGFloat((screenSize.width - labelSize.width - 40) / 2), y: CGFloat(screenSize.height / 2), width: CGFloat(labelSize.width + 40), height: CGFloat(labelSize.height + 10))
        UIView.animate(withDuration: time, animations: {() -> Void in
            showview.alpha = 0
        }, completion: {(_ finished: Bool) -> Void in
            showview.removeFromSuperview()
        })

    }
}

