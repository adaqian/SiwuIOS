//
//  AspectFitImageView.swift
//  Siwu
//
//  Created by dongqian on 16/8/27.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class AspectFitImageView: UIImageView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func intrinsicContentSize() -> CGSize {
        var s = super.intrinsicContentSize()
        s.height = self.frame.size.width / self.image!.size.width * self.image!.size.height
        return s
    }

}
