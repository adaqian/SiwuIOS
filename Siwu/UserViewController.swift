//
//  UserViewController.swift
//  Siwu
//
//  Created by dongqian on 16/8/17.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userLogout(sender: AnyObject) {
    
        AVUser.logOut()
        if AVUser.currentUser() == nil{
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("login")
            self.presentViewController(loginVC, animated: true, completion: { () -> Void in
                
            })
        }
    }

    
}
