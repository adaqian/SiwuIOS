//
//  ItemCell.swift
//  Siwu
//
//  Created by dongqian on 16/8/18.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemText: UITextView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var month: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func drawRect(rect: CGRect) {
        let bezier = UIBezierPath()
        bezier.moveToPoint(CGPoint(x:28,y:0))
        bezier.addLineToPoint(CGPoint(x:28,y:rect.size.height))
        UIColor.lightGrayColor().setStroke()
        bezier.stroke()

    }
    
}
