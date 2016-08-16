//
//  TagImageView.swift
//  Siwu
//
//  Created by dongqian on 16/8/16.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TagImageView: UIView,UIGestureRecognizerDelegate{

    var panEndCenter:CGPoint = CGPointMake(0, 0)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        print("tagImageView init")
        self.backgroundColor = UIColor.clearColor()
//        let tagInfo = TagInfo(tagX: 50, tagY: 100, tagText: "测试标签12345")
//        let tagFrameInfo = TagFrameInfo(tagInfo:tagInfo)
//        let tagView = TagView(tagFrameInfo:tagFrameInfo)
//        self.addSubview(tagView)
        
        let label = UILabel(frame: CGRectMake(0,0,100,50))
        label.text = "test123"
        label.textColor = UIColor.whiteColor()
        self.addSubview(label)
        
        let moveGes = UIPanGestureRecognizer.init(target: self, action: Selector("dragTagView:"))
        self.addGestureRecognizer(moveGes)
        
        
        //self.ww_getKeyWindow().addSubview(self)
        //self.ww_getKeyWindow().bringSubviewToFront(self)
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        print("tagImageView init coder")
        
        
    }
    
    func dragTagView(panGes:UIPanGestureRecognizer){
        let translation:CGPoint = panGes.translationInView(self.ww_getKeyWindow())
        let center:CGPoint = self.center
        self.center = CGPointMake(center.x + translation.x, center.y + translation.y)
        panGes.setTranslation(CGPointMake(0,0), inView: self.ww_getKeyWindow())
        if panGes.state == UIGestureRecognizerState.Ended{
            self.panEndCenter = self.center
            
        }
    }
    
    func ww_getKeyWindow() -> UIWindow{
        //        if UIApplication.sharedApplication().keyWindow == nil{
        //            return (UIApplication.sharedApplication().delegate?.window!)!
        //        }else{
        //            return UIApplication.sharedApplication().keyWindow!
        //        }
        
        if let keyWindow = UIApplication.sharedApplication().keyWindow{
            return keyWindow
        }else{
            return (UIApplication.sharedApplication().delegate?.window!)!
        }
    }
}
