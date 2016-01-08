//
//  ViewController.swift
//  underline
//
//  Created by apple on 16/1/8.
//  Copyright © 2016年 www.ixx.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// 第一个按钮
    @IBOutlet weak var firstButton: UIButton!
    /// 底部指示线
    @IBOutlet weak var underline: UIView!
    
    weak var selectedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func btnClick(sender: UIButton) {
        
        /// 设置按钮状态
        if (self.selectedButton != nil) {
            self.selectedButton.selected = false
        }
        sender.selected = true
        self.selectedButton = sender
        
        UIView.animateWithDuration(0.25, animations: {
            
            // 设置 underline 跟被点击的按钮的宽度一样
            self.underline.frame.size.width = sender.frame.size.width
            
            // 设置underline的y
            self.underline.frame.origin.y = CGRectGetMaxY(sender.frame) + 5
            
            // 设置 underline 跟被点击的按钮 的 终点一样
            self.underline.center.x = sender.center.x
        })
    }

    override func viewDidAppear(animated: Bool) {
        UIView.setAnimationsEnabled(false)
        self.btnClick(firstButton)
        UIView.setAnimationsEnabled(true)
    }

}

