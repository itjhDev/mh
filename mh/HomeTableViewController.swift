//
//  HomeTableViewController.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Log

class HomeTableViewController: UITableViewController, JMDelegate{

    let headNames = ["新品推荐", "新增电影", "热门电影"]
    
    var headerView: JMCarouselCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView?.delegate = self
    
    }
    
    
    func carouselCollection(carouselCollection: JMCarouselCollection, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("dasd")
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)

        Log.info(self.tableView.frame)

        self.tableView.separatorStyle = .None

        let urlImageArray: [String] = ["https://o449xphwj.qnssl.com/0510000056D3F5666714C00779085EBC.jpeg", "https://o449xphwj.qnssl.com/0510000056D01C4D6714C0018A0C3432.jpeg", "https://o449xphwj.qnssl.com/0510000056EBAE8B6714C027620C0F72.jpeg"]
        
        
        headerView = JMCarouselCollection(
            frame: CGRect(x: 0, y: 64, width:UIScreen.mainScreen().bounds.width, height: 200),
            imageURLArray: urlImageArray,
            pagePointColor: UIColor.whiteColor(),
            stepTime: 2.0)
        

        
        self.tableView.tableHeaderView = headerView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clickCurrentImage(currentIndxe: Int) {
        Log.info(currentIndxe, terminator: "");
    }
    
    
    func selectItemAtIndex(pageView: JMCarouselCollection, didSelectedPageAtIndex index: NSInteger) {
        
        
        print(";;;")
        
    }
}

extension HomeTableViewController {
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return headNames.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("homeTableViewCell", forIndexPath: indexPath) as! HomeTableViewCell

        // Configure the cell...
        cell.groupName.text = headNames[indexPath.section]

        return cell
    }
    
    
    
}
