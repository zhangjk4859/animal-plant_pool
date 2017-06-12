//
//  SettingVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/4/7.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class SettingVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    lazy var titles:Array<String> = {
        return  ["评分","分享APP","意见反馈","清除缓存"]
    }()
    
    lazy var titlesTwo:Array<String> = {
        return  ["服务条款","关于我们"]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        view.backgroundColor = UIColor.white
        
        let tableView = UITableView(frame: .init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.isScrollEnabled = false
        
        tableView.tableFooterView = UIView()
        //添加登录按钮
        let exitBtn = UIButton(frame: CGRect(x: 20, y:(tableView.tableFooterView?.frame.maxY)! + 64 + 20 , width: SCREEN_WIDTH - 40, height: 40))
        exitBtn.setTitle("安全退出", for: UIControlState.normal)
        let imageNormal = createImage(with: RGBA(r: 242, g: 65, b: 65, a: 1.0))
        let imageHighted = createImage(with: RGBA(r: 242, g: 65, b: 65, a: 0.5))
        
        exitBtn.setBackgroundImage(imageNormal, for: UIControlState.normal)
        exitBtn.setBackgroundImage(imageHighted, for: UIControlState.highlighted)
        
        exitBtn.layer.cornerRadius = 20
        exitBtn.layer.masksToBounds = true
        exitBtn.handldControlEvent(controlEvent: .touchUpInside) { 
            //做出退出动作
            
        }
        
        view.addSubview(exitBtn)

        print(fileSizeOfCache())
        
    }
    
    func fileSizeOfCache()-> Int {
        
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        //缓存目录路径
//        print(cachePath)
        
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        //快速枚举出所有文件名 计算文件大小
        var size = 0
        for file in fileArr! {
            
            // 把文件名拼接到路径中
            let path = cachePath?.appending("/\(file)")
            // 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path!)
            // 用元组取出文件大小属性
            for (abc, bcd) in floder {
                // 累加文件大小
                if abc == FileAttributeKey.size {
                    size += (bcd as AnyObject).integerValue
                }
            }
        }
        
        let mm = size / 1024 / 1024
        
        return mm
    }
   
    func clearCache() {
        
        // 取出cache文件夹目录 缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        
        // 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        // 遍历删除
        for file in fileArr! {
            
            let path = cachePath?.appending("/\(file)")
            if FileManager.default.fileExists(atPath: path!) {
                
                do {
                    try FileManager.default.removeItem(atPath: path!)
                } catch {
                    
                }
            }
        }
    }
    

    

}

extension SettingVC{
    
    // MARK: - tableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return titles.count
        case 1:
            return titlesTwo.count
        default:
            return 0
        }
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        switch indexPath.section {
        case 0:
            cell?.textLabel?.text = titles[indexPath.row]
            if indexPath.row == 3 {
                cell?.detailTextLabel?.text = "\(fileSizeOfCache())M"
            }
        case 1:
            cell?.textLabel?.text = titlesTwo[indexPath.row]
        default: break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:break
                case 1:break
                case 2:break
                case 3:
                clearCache()
            default:break
            }
        case 1:
            switch indexPath.row {
            case 0:break
            case 1:break
            case 2:break
            case 3:break
                
            default:break
            }
        default:break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    
}
