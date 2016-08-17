//
//  EditItemTextController.swift
//  Siwu
//
//  Created by dongqian on 16/8/17.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class EditItemTextController: UIViewController {

    @IBOutlet weak var itemTitle: JVFloatLabeledTextField!
    @IBOutlet weak var itemText: JVFloatLabeledTextView!
    var itemImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("pushItemNotification:"), name: "pushItemNotification", object: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func pushItemNotification(notification:NSNotification){
        let dict = notification.userInfo
        if String(dict!["success"]!) == "true"{
            ProgressHUD.showSuccess("上传成功")
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
            })
        }else{
            ProgressHUD.showError("上传失败")
        }
    }
    
    @IBAction func saveItemInfo(sender: AnyObject) {
        let dict:NSDictionary = [
            "itemTitle":self.itemTitle.text!,
            "itemText":self.itemText.text!,
            "itemImage":self.itemImage!,
            "category":"1"
        ]
        PushItemInfo.pushItemInBackground(dict)
    }
 }