//
//  CreateItemViewController.swift
//  Siwu
//
//  Created by dongqian on 16/8/4.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class CreateItemViewController: UITableViewController,PhotoPickerDelegate,VPImageCropperDelegate
{

    
    @IBOutlet weak var titleView: JVFloatLabeledTextField!
    @IBOutlet weak var choosePhotoButton: UIButton!
    @IBOutlet weak var descriptionView: JVFloatLabeledTextView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //titleTextField.backgroundColor = UIColor.clearColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true){ () -> Void in
        }
    }
    
    @IBAction func save(sender: AnyObject) {
    }
    
    @IBAction func choosePhoto(sender: AnyObject) {
        let vc = PhotoPickerViewController()
        vc.delegate = self
        self.presentViewController(vc, animated: true){ () -> Void in
        }
    }
    //PhotoPickerDelegate
    func getImageFromPicker(image:UIImage){
        //self.bookTitle?.bookCover?.setImage(image, forState: .Normal)
        let croVC = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_WIDTH*1.273), limitScaleRatio: 3)
        croVC.delegate = self
        self.presentViewController(croVC, animated: true){ () -> Void in
        }
        
    }
    //VPImageDelegate
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true){ () -> Void in
        }
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        choosePhotoButton.setImage(editedImage, forState: .Normal)
        cropperViewController.dismissViewControllerAnimated(true){ () -> Void in
        }
        
        
    }
}
