//
//  MineVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/15.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class MineVC: UITableViewController {
    
    var titles : Array<String>?
    var images : Array<String>?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //注册cell®️™
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //cell的标题
        titles = ["我的日记","我的经验","我的收藏","设置"]
        images = ["diary","experience","collection","set"]
        tableView.isScrollEnabled = false
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        
    }

    // MARK: - Table view data source
    
    //多少行
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //具体的cell设置
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.contentView.backgroundColor = UIColor.clear
        cell.imageView?.image = UIImage(named: images![indexPath.section])
        cell.textLabel?.text = titles![indexPath.section]
        return cell
    }
 
    //行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //多少组
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        else {
           return 10
        }
    }
    
    //头部视图设置
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headView = Bundle.main.loadNibNamed(String(describing:HeaderView.self), owner: self, options: nil)?.first as! HeaderView
            headView.focusLabel.text = "38"
            return headView
        }else{
            return nil
        }
    }
    
    // MARK: - Table view delagate
    //选中cell操作
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.section {
        case 0: break
            
        case 1: break
            
        case 2: break
            
        case 3:
                let settingVC = SettingVC()
                 settingVC.hidesBottomBarWhenPushed = true
                navigationController?.pushViewController(settingVC, animated: true)
            
        default: break
            
        }
       
    }

}
