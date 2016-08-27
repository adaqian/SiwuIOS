//
//  MyCell.swift
//  Siwu
//
//  Created by dongqian on 16/8/26.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

protocol MyCellDelegate{
    func changeCellHeight(height:CGFloat,indexPath: NSIndexPath)
}

class MyCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    var delegate:MyCellDelegate!
    var cellHeight:CGFloat=100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMessage(dict:AVObject,indexPath: NSIndexPath){
        itemLabel.text = dict["itemTitle"] as! String
        
        let date = dict["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        //itemDate.text = format.stringFromDate(date!)
        
        let imageFile = dict["itemImage"] as? AVFile
        print(imageFile?.url)
        //itemImage.sd_setImageWithURL(NSURL(string:(imageFile?.url)!), placeholderImage: UIImage(named: "box"))
        itemImage.sd_setImageWithURL(NSURL(string:(imageFile?.url)!), placeholderImage: UIImage(named: "box"), completed: { (image,error,cacheType,url) -> Void in
                        print("image load success")
                        print("image size: width = \(self.itemImage.frame.width),height = \(self.itemImage.frame.height)")
                        print(CGRectGetMaxY(self.itemImage.frame))
                        self.layoutIfNeeded()
                        self.cellHeight=CGRectGetMaxY(self.itemImage.frame)+10
                        self.delegate.changeCellHeight(self.cellHeight,indexPath: indexPath)
                    })
        
    }
    
    func getCellHeight(){
       
    }
    
}
