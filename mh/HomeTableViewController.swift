//
//  HomeTableViewController.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
 
	let headNames = ["新品推荐", "新增电影", "热门电影"]

	override func viewDidLoad() {
		super.viewDidLoad()
		    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       
        self.tableView.separatorStyle = .None
        
    }
    

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

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

		return cell
	}
    
}
