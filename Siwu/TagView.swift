//
//  TagView.swift
//  Siwu
//
//  Created by dongqian on 16/8/15.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TagView: UIView,UIGestureRecognizerDelegate{

    var textLabel:UILabel?
    var iconView:UIImageView?
    var textBG:UIImageView?
    var canTouch:Bool = false
    var tagFrameInfo:TagFrameInfo?
    var beginPoint:CGPoint?
    var endPoint:CGPoint?
     
    init(tagFrameInfo:TagFrameInfo) {
        super.init(frame: tagFrameInfo.viewFrame)
        //self.backgroundColor = UIColor.blackColor()
        self.iconView = UIImageView(frame: tagFrameInfo.iconViewFrame)
        self.iconView?.image = UIImage(named: "o_tagpoint")
        self.addSubview(self.iconView!)
        
        self.textBG = UIImageView(frame: tagFrameInfo.textBGFram)
        self.textBG?.image = UIImage(named: "o_tag_text_bg_left")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0,10,0,10), resizingMode: UIImageResizingMode.Stretch)
        self.addSubview(self.textBG!)
        
        self.textLabel = UILabel(frame: tagFrameInfo.textLabelFrame)
        self.textLabel?.text = tagFrameInfo.tagInfo.tagText as String
        self.textLabel?.font = UIFont.systemFontOfSize(12)
        self.textLabel?.textColor = UIColor.whiteColor()
        self.addSubview(self.textLabel!)
        
        let moveGes = UIPanGestureRecognizer.init(target: self, action: Selector("dragTagView:"))
        self.addGestureRecognizer(moveGes)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dragTagView(panGes:UIPanGestureRecognizer){
        let translation:CGPoint = panGes.translationInView(self.ww_getKeyWindow())
        let center:CGPoint = self.center
        self.center = CGPointMake(center.x + translation.x, center.y + translation.y)
        let x = self.frame.origin.x
        let y = self.frame.origin.y + 13.5
        //print("x=\(x),y=\(y)")
        panGes.setTranslation(CGPointMake(0,0), inView: self.ww_getKeyWindow())
        if panGes.state == UIGestureRecognizerState.Ended{
            //self.panEndCenter = self.center
            self.endPoint = CGPointMake(x, y)
            print("end point: x=\(x),y=\(y)")
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
