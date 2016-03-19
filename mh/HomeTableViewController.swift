//
//  HomeTableViewController.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Log

class HomeTableViewController: UITableViewController, CirCleViewDelegate {

    let headNames = ["新品推荐", "新增电影", "热门电影"]
    var circleView: CirCleView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height)

        Log.info(self.tableView.frame)

        self.tableView.separatorStyle = .None

        let urlImageArray: [String] = ["https://o449xphwj.qnssl.com/0510000056D3F5666714C00779085EBC.jpeg", "https://o449xphwj.qnssl.com/0510000056D01C4D6714C0018A0C3432.jpeg"]

        self.circleView = CirCleView(frame: CGRectMake(0, 64, self.view.frame.size.width, 200), urlImageArray: urlImageArray)

        circleView.backgroundColor = UIColor.orangeColor()
        circleView.delegate = self
        
        self.tableView.tableHeaderView = circleView
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
