//
//  ItemInfo.swift
//  Siwu
//
//  Created by dongqian on 16/8/17.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class PushItemInfo: NSObject {
    
    static func pushItemInBackground(dict:NSDictionary){
        let object = AVObject(className: "ItemInfo")
        object.setObject(dict["itemText"], forKey: "itemText")
        object.setObject(dict["category"], forKey: "category")
        object.setObject(dict["itemTitle"], forKey: "itemTitle")
        object.setObject(AVUser.currentUser(), forKey: "user")
        
        let image = dict["itemImage"] as? UIImage
        let imageFile = AVFile(data: UIImagePNGRepresentation(image!))
        imageFile.saveInBackgroundWithBlock { (success, error) -> Void in
            if success{
                object.setObject(imageFile, forKey: "itemImage")
                object.saveInBackgroundWithBlock({ (success, error) -> Void in
                    if success{
                        print("upload sucess!")
                        NSNotificationCenter.defaultCenter().postNotificationName("pushItemNotification", object: nil, userInfo: ["success":"true"])
                    }else{
                        NSNotificationCenter.defaultCenter().postNotificationName("pushItemNotification", object: nil, userInfo: ["success":"false"])
                    }
                    
                })
            }else{
                NSNotificationCenter.defaultCenter().postNotificationName("pushItemNotification", object: nil, userInfo: ["success":"false"])
            }
        }
    }
}
