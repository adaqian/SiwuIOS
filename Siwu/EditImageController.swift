//
//  EditImageController.swift
//  Siwu
//
//  Created by 倩 on 16/8/14.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class EditImageController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ///imageView.image = image
        //print(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
