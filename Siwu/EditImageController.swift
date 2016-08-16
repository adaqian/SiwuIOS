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
    var canTouch:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        self.navigationController?.setToolbarHidden(false, animated: true)

//        let tagInfo = TagInfo(tagX: 50, tagY: 100, tagText: "测试标签12345")
//        let tagFrameInfo = TagFrameInfo(tagInfo:tagInfo)
//        let tagView = TagView(tagFrameInfo: tagFrameInfo)
//        self.view.addSubview(tagView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true){ () -> Void in
        }
    }

    
    @IBAction func addTextTag(segue:UIStoryboardSegue){
        let vc = segue.sourceViewController as! AddTagController
        let tagText = vc.tagName.text
        //print("x=\(self.imageView.center.x),y=\(self.imageView.center.y)")
        let tagInfo = TagInfo(tagX: 50, tagY: 100, tagText: tagText!)
        let tagFrameInfo = TagFrameInfo(tagInfo:tagInfo)
        let tagView = TagView(tagFrameInfo:tagFrameInfo)
        self.view.addSubview(tagView)
    }

    
}
