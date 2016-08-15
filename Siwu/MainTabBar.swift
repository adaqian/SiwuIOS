//
//  MainTabBar.swift
//  Siwu
//
//  Created by 倩 on 16/8/14.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {

    /// 懒加载撰写按钮，设置图片并添加到TabBar中
    lazy var composeButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "plus"), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: "plus"), forState: UIControlState.Highlighted)
        //btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        //btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        // 添加到父控件中
        self.addSubview(btn)
        
        return btn
    }()
    
    private let buttonCount = 5
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //print(self.subviews as NSArray)
        /// 设置每个按钮的宽高和基准尺寸
        let w = self.bounds.width / CGFloat(buttonCount)
        let h = self.bounds.height
        let frame = CGRectMake(0, 0, w, h)
        
        var index: CGFloat = 0
        for view in self.subviews as! [UIView] {
            if (view is UIControl && !(view is UIButton)) {
                /**
                 *  当前控件是响应者对象，并且不是 UIButton 类型时参照设置尺寸位置
                 */
                view.frame = CGRectOffset(frame, index * w, 0)
                index += (index == 1) ? 2 : 1
            }
        }
        /**
         *  设置撰写按钮的尺寸和位置
         */
        self.composeButton.frame = frame
        self.composeButton.center = CGPointMake(self.bounds.width * 0.5, self.bounds.height * 0.5 )
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    

}
