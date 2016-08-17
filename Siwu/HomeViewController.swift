//
//  HomeViewController.swift
//  Siwu
//
//  Created by dongqian on 16/8/17.
//  Copyright © 2016年 edu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if AVUser.currentUser() == nil{
            let story = UIStoryboard(name: "Login", bundle: nil)
            let loginVC = story.instantiateViewControllerWithIdentifier("login")
            self.presentViewController(loginVC, animated: true, completion: { () -> Void in
                
            })
        }else{
            print("Login username:\(AVUser.currentUser().username)------------------------------")
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            
            self.navigationController?.navigationBar.translucent = false
            //self.navigationController?.toolbar.translucent = false
            tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector("headerRefresh"))
            tableView.mj_footer = MJRefreshBackNormalFooter(refreshingTarget: self, refreshingAction: Selector("footerRefresh"))
            
            tableView.mj_header.beginRefreshing()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as! UITableViewCell
        let dict = dataArray[indexPath.row] as? AVObject
        
        let itemImage = cell.viewWithTag(102) as! UIImageView
        let itemTitle = cell.viewWithTag(101) as! UILabel
        let itemDate = cell.viewWithTag(103) as! UILabel
        
        itemTitle.text = dict!["itemTitle"] as! String
        
        let date = dict!["createdAt"] as? NSDate
        let format = NSDateFormatter()
        format.dateFormat = "yyyy-MM-dd hh:mm"
        itemDate.text = format.stringFromDate(date!)
        
        let imageFile = dict!["itemImage"] as? AVFile
        itemImage.sd_setImageWithURL(NSURL(string:(imageFile?.url)!), placeholderImage: UIImage(named: "box"))
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        let vc = BookDetailViewController()
//        vc.bookDetail = dataArray[indexPath.row] as? AVObject
//        vc.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    func headerRefresh(){
        let query = AVQuery(className: "ItemInfo")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = 0
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_header.endRefreshing()
            self.dataArray.removeAllObjects()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }
    }
    
    func footerRefresh(){
        let query = AVQuery(className: "ItemInfo")
        query.orderByDescending("createdAt")
        query.limit = 20
        query.skip = self.dataArray.count
        query.whereKey("user", equalTo: AVUser.currentUser())
        query.findObjectsInBackgroundWithBlock { (results, error) -> Void in
            self.tableView?.mj_footer.endRefreshing()
            self.dataArray.addObjectsFromArray(results)
            self.tableView?.reloadData()
        }
    }
}
