//
//  MainTabBarController.swift
//  Siwu
//
//  Created by 倩 on 16/8/14.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController,PhotoPickerDelegate{

    @IBOutlet weak var mainTabBar: MainTabBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        //addChildViewController(<#T##childController: UIViewController##UIViewController#>)
        mainTabBar.composeButton.addTarget(self, action: #selector(MainTabBarController.composeButtonClick), forControlEvents: UIControlEvents.TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func composeButtonClick(){
        print(#function)
        let vc = PhotoPickerViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true, completion:{ (action) -> Void in
            
        })
    }

    //PhotoPickerDelegate
    func getImageFromPicker(image:UIImage){
        //self.bookTitle?.bookCover?.setImage(image, forState: .Normal)
        //        let croVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH*1.273), limitScaleRatio: 3)
//        croVC.delegate = self
//        self.presentViewController(croVC, animated: true){ () -> Void in
//        }
        //no crop
        let story = UIStoryboard(name: "PushImage", bundle: nil)
        let vc = story.instantiateViewControllerWithIdentifier("pushImage")
        self.presentViewController(vc, animated: true, completion: { () -> Void in
            
        })

        //vc.image = image
        self.presentViewController(vc, animated: true){ () -> Void in
        }
        
    }
    

}
