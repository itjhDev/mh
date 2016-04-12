//
//  MovieInfoViewController.swift
//  mh
//
//  Created by 宋立君 on 16/3/30.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Log
import Alamofire

class MovieInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        self.navigationController?.navigationBar.backgroundColor = UIColor.blackColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)

    }
    
    @IBAction func downMovie(sender: UIButton) {
        
        let destination = Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
        
//        https://dn-itjhcdn.qbox.me/720PAtPrestonCastle.mp4 
        
       
        Alamofire.download(.GET, "ftp://ygdy8:ygdy8@y153.dydytt.net:8058/[%e9%98%b3%e5%85%89%e7%94%b5%e5%bd%b1www.ygdy8.com].%e6%b2%99%e6%bc%a0%e5%a5%b3%e7%8e%8b.BD.720p.%e4%b8%ad%e8%8b%b1%e5%8f%8c%e5%ad%97%e5%b9%95.rmvb", destination: destination)
            .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                print(totalBytesRead)
                
                // This closure is NOT called on the main queue for performance
                // reasons. To update your ui, dispatch to the main queue.
                dispatch_async(dispatch_get_main_queue()) {
                    print("Total bytes read on main queue: \(totalBytesRead)")
                }
                
                let percent = totalBytesRead*100/totalBytesExpectedToRead
                
                print("已下载：\(totalBytesRead)  当前进度：\(percent)%")
            }
            .response { _, _, _, error in
                if let error = error {
                    print("Failed with error: \(error)")
                } else {
                    print("Downloaded file successfully")
                }
        }
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        
        Log.info(path)
        
        Log.info("下载电影")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
