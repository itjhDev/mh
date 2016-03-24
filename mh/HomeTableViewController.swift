//
//  HomeTableViewController.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Log
import SDCycleScrollView

class HomeTableViewController: UITableViewController,  SDCycleScrollViewDelegate {

    let headNames = ["新品推荐", "新增电影", "热门电影"]
    
    var tableHeardView = SDCycleScrollView()


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)
        
        Log.info(self.tableView.frame)
        
        self.tableView.separatorStyle = .None
        
        let urlImageArray: [String] = ["https://o449xphwj.qnssl.com/0510000056D3F5666714C00779085EBC.jpeg", "https://o449xphwj.qnssl.com/0510000056D01C4D6714C0018A0C3432.jpeg","https://o449xphwj.qnssl.com/0510000056EBAE8B6714C027620C0F72.jpeg"]
        

        
        tableHeardView = SDCycleScrollView(frame: CGRectMake(0, 64, self.view.frame.size.width, 200))
        
        
        tableHeardView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        tableHeardView.delegate = self;
        
        
        tableHeardView.placeholderImage = UIImage(named: "tutorial_background_03")
        tableHeardView.autoScrollTimeInterval = 4
        tableHeardView.showPageControl = false
        tableHeardView.imageURLStringsGroup = urlImageArray
                self.tableView.tableHeaderView = tableHeardView

        
    }
    
    
    func cycleScrollView(cycleScrollView: SDCycleScrollView!, didSelectItemAtIndex index: Int) {
    
        Log.info("点击了\(index)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func clickCurrentImage(currentIndxe: Int) {
        Log.info(currentIndxe, terminator: "");
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
