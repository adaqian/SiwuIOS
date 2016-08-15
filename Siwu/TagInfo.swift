//
//  TagInfo.swift
//  Siwu
//
//  Created by dongqian on 16/8/15.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TagInfo: NSObject {

    var tagX:CGFloat = 0.0
    var tagY:CGFloat = 0.0
    var tagText:NSString
    
    init(tagX:CGFloat,tagY:CGFloat,tagText:NSString){
        self.tagX = tagX
        self.tagY = tagY
        self.tagText = tagText
    }
}
