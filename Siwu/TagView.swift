//
//  TagView.swift
//  Siwu
//
//  Created by dongqian on 16/8/15.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TagView: UIView {

    var textLabel:UILabel?
    var iconView:UIImageView?
    var textBG:UIImageView?
    var canTouch:Bool = false
    var tagFrameInfo:TagFrameInfo
    
    init(tagFrameInfo:TagFrameInfo) {
        self.tagFrameInfo = tagFrameInfo
        super.init(frame: tagFrameInfo.viewFrame)
        
        self.userInteractionEnabled = true
        self.backgroundColor = UIColor.clearColor()
        
        self.iconView = UIImageView(frame: tagFrameInfo.iconViewFrame)
        self.iconView?.image = UIImage(named: "o_tagpoint")
        self.addSubview(self.iconView!)
        
        self.textBG = UIImageView(frame: tagFrameInfo.textBGFram)
        //self.textBG?.image = UIImage.resizeImageWithName("o_tag_text_bg_left", left: 0.3, top: 0.5)
        //self.textBG?.image = UIImage(named: "o_tag_text_bg_left")?.stretchableImageWithLeftCapWidth(10, topCapHeight: 0)
        self.textBG?.image = UIImage(named: "o_tag_text_bg_left")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0,10,0,10), resizingMode: UIImageResizingMode.Stretch)
        self.addSubview(self.textBG!)
        
        self.textLabel = UILabel(frame: tagFrameInfo.textLabelFrame)
        self.textLabel?.text = tagFrameInfo.tagInfo.tagText as String
        self.textLabel?.font = UIFont.systemFontOfSize(12)
        //self.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.textLabel?.textColor = UIColor.whiteColor()
        self.addSubview(self.textLabel!)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
