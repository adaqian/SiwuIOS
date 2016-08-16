//
//  AddTagController.swift
//  Siwu
//
//  Created by dongqian on 16/8/16.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class AddTagController: UIViewController {

    @IBOutlet weak var tagName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.setToolbarHidden(true, animated: true)
        //print(imageView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
