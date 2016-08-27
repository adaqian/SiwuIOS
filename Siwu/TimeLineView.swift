//
//  TimeLineView.swift
//  Siwu
//
//  Created by dongqian on 16/8/18.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class TimeLineView: UIView {


    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPoint(x:1,y:0))
    }


}
