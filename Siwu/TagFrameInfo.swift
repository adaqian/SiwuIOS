//
//  TagFrameInfo.swift
//  Siwu
//
//  Created by dongqian on 16/8/15.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TagFrameInfo: NSObject {

    let textPadding:CGFloat = 10
    var textBGH:CGFloat = 27
    let textBGW:CGFloat = 22
    let pointWH:CGFloat = 15
    var viewFrame:CGRect
    var iconViewFrame:CGRect
    var textBGFram:CGRect
    var textLabelFrame:CGRect
    var isRight:Bool = false
    var tagInfo:TagInfo
    
    init(tagInfo:TagInfo){
        self.tagInfo = tagInfo
        //let font = UIFont.systemFontOfSize(12)
        //let atts = [NSFontAttributeName:font]
        let textSize:CGSize = tagInfo.tagText.sizeWithAttributes([NSFontAttributeName:UIFont.systemFontOfSize(12)])
        //let textSize:CGRect = tagInfo.tagText.boundingRectWithSize(CGSizeMake(100,0), options: .UsesLineFragmentOrigin, attributes: atts, context: nil)
        
        //textBGH = textSize.height + textPadding * 2
        
        iconViewFrame = CGRectMake(tagInfo.tagX, tagInfo.tagY - pointWH * 0.5, pointWH, pointWH)
        
        
        textBGFram = CGRectMake(tagInfo.tagX + pointWH , tagInfo.tagY - textBGH * 0.5, textBGW + textSize.width + textPadding , textBGH)
        textLabelFrame = CGRectMake(tagInfo.tagX + pointWH + textBGW , tagInfo.tagY - textSize.height * 0.5, textSize.width, textSize.height)
        
        viewFrame = CGRectMake(tagInfo.tagX, tagInfo.tagY - textBGH * 0.5, pointWH + textBGFram.width, textBGH)
        
    }

}
