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

        imageView.image = image
        self.navigationController?.setToolbarHidden(false, animated: true)
        //print(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true){ () -> Void in
        }
    }

    @IBAction func addTextTag(sender: AnyObject) {
        let tagInfo = TagInfo(tagX: 50, tagY: 100, tagText: "测试标签12345")
        let tagFrameInfo = TagFrameInfo(tagInfo:tagInfo)
        let tagView = TagView(tagFrameInfo:tagFrameInfo)
        tagView.userInteractionEnabled = true
        tagView.canTouch = true
        self.imageView.addSubview(tagView)
    }
    

}
