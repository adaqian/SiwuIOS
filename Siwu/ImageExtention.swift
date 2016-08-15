//
//  ImageViewExtention.swift
//  Siwu
//
//  Created by dongqian on 16/8/15.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

extension UIImage{
    
    static func resizeImageWithName(name:String,left:CGFloat,top:CGFloat) -> UIImage{
        let image = UIImage(named: name)
        return image!.stretchableImageWithLeftCapWidth(Int(image!.size.width*left), topCapHeight: Int(image!.size.height*top))
    }
    
    static func resizeImageWithName(name:String) -> UIImage{
        return resizeImageWithName(name,left:0.5,top:0.5)
    }
}
