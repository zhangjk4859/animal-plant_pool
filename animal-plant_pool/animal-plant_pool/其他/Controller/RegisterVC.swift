//
//  RegisterVC.swift
//  animal-plant_pool
//
//  Created by 张俊凯 on 2017/2/18.
//  Copyright © 2017年 张俊凯. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController,UITextFieldDelegate {
        
        //登录按钮全局变量
        var loginBtn:UIButton!
        //手机号码输入框全局变量
        var phoneTextField :UITextField!
        //密码输入框全局变量
        var passwordTextField :UITextField!
        //手机号码可用记录状态
        var phoneIsTrue:Bool!
        //密码可用记录状态
        var passwordIsTrue:Bool!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //默认为NO
            phoneIsTrue = false
            passwordIsTrue = false
            
            //添加控件
            setupUI()
            
        }


        //登录信息
        func loginAction(){
            print("loginAction")
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
        
        func setupUI(){
            //背景色设置为灰色
            view.backgroundColor = THEME_GRAY
            
            let gap:CGFloat = SCREEN_HEIGHT * 0.015
            let height:CGFloat = SCREEN_HEIGHT * 0.06
            let leftMargin:CGFloat = 0
            let fontsize:CGFloat = 14
            
            //设置一个label
            let titleLabel = UILabel(frame: CGRect(x: gap * 0.5, y: NAVBAR_HEIGHT, width: SCREEN_WIDTH, height: 40))
            titleLabel.text = "首次登陆的用户，输入手机号后按提示设置密码即可登陆"
            titleLabel.textColor = GRAY_STRING
            titleLabel.font = UIFont.systemFont(ofSize: 11)
            view.addSubview(titleLabel)
            
            //添加手机号输入框
            let phoneTextField = JKTextField(frame: CGRect(x: leftMargin, y: titleLabel.frame.maxY, width: SCREEN_WIDTH, height: height))
            view.addSubview(phoneTextField)
            phoneTextField.backgroundColor = UIColor.white
            phoneTextField.leftViewMode = UITextFieldViewMode.always
            let phoneLabel = UILabel(frame: CGRect(x: leftMargin, y: 0, width: height, height: height))
            phoneLabel.textColor = UIColor.black
            phoneLabel.text = "+86"
            phoneLabel.font = UIFont.systemFont(ofSize: fontsize)
            phoneLabel.textAlignment = NSTextAlignment.center
            phoneTextField.leftView = phoneLabel
            phoneTextField.placeholder = "请输入您的手机号"
            phoneTextField.placeholderFontSize = fontsize
            phoneTextField.keyboardType = UIKeyboardType.numberPad
            phoneTextField.clearButtonMode = UITextFieldViewMode.whileEditing
            phoneTextField.delegate = self
            self.phoneTextField = phoneTextField
           
    
            
            //验证码输入框
            let codeTextField = JKTextField(frame: CGRect(x: leftMargin, y: phoneTextField.frame.maxY + gap, width: SCREEN_WIDTH, height: height))
            view.addSubview(codeTextField)
            codeTextField.backgroundColor = UIColor.white
            codeTextField.placeholder = "请输入验证码"
            codeTextField.placeholderFontSize = fontsize
            codeTextField.keyboardType = UIKeyboardType.numberPad
            codeTextField.clearButtonMode = UITextFieldViewMode.whileEditing
            codeTextField.leftViewMode = UITextFieldViewMode.always
            codeTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: (height - phoneLabel.intrinsicContentSize.width) / 2, height: height))
            
            
            //添加密码输入框
            let passwordTextField = JKTextField(frame: CGRect(x: leftMargin, y: codeTextField.frame.maxY + gap, width: SCREEN_WIDTH, height: height))
            view.addSubview(passwordTextField)
            passwordTextField.backgroundColor = UIColor.white
            passwordTextField.leftViewMode = UITextFieldViewMode.always
            let passwordLabel = UILabel(frame: CGRect(x: leftMargin, y: 0, width: height, height: height))
            passwordLabel.textColor = UIColor.black
            passwordLabel.text = "密码"
            passwordLabel.font = UIFont.systemFont(ofSize: fontsize)
            passwordLabel.textAlignment = NSTextAlignment.center
            passwordTextField.leftView = passwordLabel
            passwordTextField.placeholder = "请设置您的密码"
            passwordTextField.placeholderFontSize = fontsize
            passwordTextField.clearButtonMode = UITextFieldViewMode.whileEditing
            passwordTextField.isSecureTextEntry = true
            passwordTextField.delegate = self
            self.passwordTextField = passwordTextField

            //添加确认密码输入框
            let confirmPWDTextField = JKTextField(frame: CGRect(x: leftMargin, y: passwordTextField.frame.maxY + gap, width: SCREEN_WIDTH, height: height))
            view.addSubview(confirmPWDTextField)
            confirmPWDTextField.backgroundColor = UIColor.white
            confirmPWDTextField.leftViewMode = UITextFieldViewMode.always
            let passwordLabelTwo = UILabel(frame: CGRect(x: leftMargin, y: 0, width: height, height: height))
            passwordLabelTwo.textColor = UIColor.black
            passwordLabelTwo.text = "密码"
            passwordLabelTwo.font = UIFont.systemFont(ofSize: fontsize)
            passwordLabelTwo.textAlignment = NSTextAlignment.center
            confirmPWDTextField.leftView = passwordLabelTwo
            confirmPWDTextField.placeholder = "请确认您的密码"
            confirmPWDTextField.placeholderFontSize = fontsize
            confirmPWDTextField.clearButtonMode = UITextFieldViewMode.whileEditing
            confirmPWDTextField.isSecureTextEntry = true
            confirmPWDTextField.delegate = self
            
            //添加注册按钮
            let loginBtn = UIButton(frame: CGRect(x: gap * 0.5, y: confirmPWDTextField.frame.maxY + gap , width: SCREEN_WIDTH - gap, height: height))
            view.addSubview(loginBtn)
            loginBtn.setTitle("注册并登录", for: UIControlState.normal)
            let imageNormal = createImage(with: THEME_GREEN)
            let imageHighted = createImage(with: THEME_GREEN_HILIGHTED)
            let imageDisable = createImage(with: RGBA(r: 180, g: 180, b: 180, a: 0.5))
            loginBtn.setBackgroundImage(imageNormal, for: UIControlState.normal)
            loginBtn.setBackgroundImage(imageHighted, for: UIControlState.highlighted)
            loginBtn.setBackgroundImage(imageDisable, for: .disabled)
            loginBtn.layer.cornerRadius = height * 0.5
            loginBtn.layer.masksToBounds = true
            loginBtn.addTarget(self, action: #selector(self.loginAction), for: UIControlEvents.touchUpInside)
            self.loginBtn = loginBtn
            loginBtn.isEnabled = false
            //隐藏底部栏
            hidesBottomBarWhenPushed = true
        }
        
        
}
    
extension RegisterVC{
    
    
    //动态输入的时候调用的方法
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let strLength: Int = textField.text!.characters.count - range.length + string.characters.count
        if textField == phoneTextField{//手机号码输入框
            //限制手机号为11位，预先加上一位，防止删除的时候无法作用
            
            if strLength < 11{
                //按钮关闭
                phoneIsTrue = false
            }else if strLength == 11 {//检查是不是手机号
                
                if !isMobile(phoneNumber: textField.text! + string){
                    //不是手机号码，提示用户
                    JKAlertView.showMessage("您输入是手机号码格式不对", duration: 3)
                }else{
                    //按钮点亮
                    phoneIsTrue = true
                }
            }else {//大于11位
                
                //不可继续输入数字
                return false
            }
            
            //如果都符合条件，登录按钮可用
            loginBtn.isEnabled = phoneIsTrue && passwordIsTrue
            
            return true
            
        }else{//密码输入框
            
            //密码大于六位
            if strLength >= 6{
                passwordIsTrue = true
            }else{
                passwordIsTrue = false
            }
            
            //如果都符合条件，登录按钮可用
            loginBtn.isEnabled = phoneIsTrue && passwordIsTrue
            
            //可以继续输入
            return true
        }
        
    }
    
}


