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
        //验证码输入框
        var codeTextField : UITextField!
        //密码输入框全局变量
        var passwordTextField :UITextField!
        //确认密码输入框
        var confirmPasswordTextField :UITextField!
        //手机号码可用记录状态
        var phoneIsTrue:Bool!
        //密码可用记录状态
        var passwordIsTrue:Bool!
        //发送短信按钮
        var rightBtn:UIButton!
        //短信倒计时的计时器
        private var countdownTimer: Timer?
        //记录输入框有内容的个数
        var textFieldCount : Int = 0
    
        //剩余时间
        var remainingSeconds: Int = 0 {
            willSet {
                rightBtn.setTitle("重新获取\(newValue)秒", for: .normal)
                rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                if newValue <= 0 {
                    rightBtn.setTitle("发送验证码", for: .normal)
                    rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                    isCounting = false
                }
            }
        }
        //记录倒计时状态
        var isCounting = false {
            willSet {
                if newValue {
                    countdownTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
                        self.remainingSeconds -= 1
                    })
                    remainingSeconds = 30
                } else {
                    countdownTimer?.invalidate()
                    countdownTimer = nil
                }
                rightBtn.isEnabled = !newValue
            }
        }
    
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
            codeTextField.rightViewMode = .always
            let rightBtn = UIButton(frame: .init(x: 0, y: 0, width: height * 2, height: height * 0.5))
            rightBtn.setTitle("发送验证码", for: .normal)
            rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            rightBtn.setBackgroundImage(createImage(with:RGB(r: 228, g: 62, b: 65) ), for: .normal)
            rightBtn.setBackgroundImage(createImage(with: RGBA(r: 228, g: 62, b: 65, a: 0.3)), for: .highlighted)
            rightBtn.layer.cornerRadius = rightBtn.height * 0.5
            rightBtn.layer.masksToBounds = true
            rightBtn.handldControlEvent(controlEvent: .touchUpInside) {
                //发送验证码
                
                //倒计时
                isCounting = true
    
            }
            self.rightBtn = rightBtn
            codeTextField.rightView = rightBtn
            self.codeTextField = codeTextField
            codeTextField.delegate = self
            
            
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
            self.confirmPasswordTextField = confirmPWDTextField
            
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        //四个输入框都不为空的时候按钮点亮
        if (phoneTextField.text?.characters.count)! > 0     &&
            (codeTextField.text?.characters.count)! > 0     &&
            (passwordTextField?.text?.characters.count)! > 0    &&
            (confirmPasswordTextField?.text?.characters.count)! > 0
        {
            loginBtn.isEnabled = true
        }else{
            loginBtn.isEnabled = false
        }
    }

    
    
}


