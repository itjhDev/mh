//
//  MHTabbarViewController.swift
//  mh
//
//  Created by 宋立君 on 16/4/19.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit

class MHTabbarViewController: UITabBarController {

    private enum Tab: Int {

        case Home

        var title: String {

            switch self {
            case .Home:
                return NSLocalizedString("Home3", comment: "")
            }
        }
    }

    private var previousTab = Tab.Home

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITabBarControllerDelegate

extension MHTabbarViewController: UITabBarControllerDelegate {

//    /**
//     设置双击tabbar回到顶部
//
////     */
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {

        let vc = self.tabBarController?.selectedViewController

        print("vc-> \(vc)")

        print("select-tag \(tabBarController.tabBar.selectedItem!.tag)")
        print("selectedIndex \(self.selectedIndex)")
        print("---------------------------")

        if tabBarController.tabBar.selectedItem!.tag == 0 && self.selectedIndex == 0 {
            let nvc = viewController as! UINavigationController
            let hTableV = nvc.topViewController as! HomeTableViewController

            /// 确定只有在当前选择tabbar中点击才有效
            if viewController.isEqual(nvc) == true {
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    // 回到最上方
                    print("回到顶部!")
                    hTableV.tableView.contentOffset = CGPointMake(0, -55)
                })

                return false
            }
            else {

                return true
            }
        }

//        let nvc = viewController as! UINavigationController
//       let hTableV =  nvc.topViewController as! HomeTableViewController
//
//
//        /// 确定只有在当前选择tabbar中点击才有效
//        if viewController.isEqual(nvc) == true {
//            UIView.animateWithDuration(0.25, animations: { () -> Void in
//                // 回到最上方
//
//                hTableV.tableView.contentOffset = CGPointMake(0, -55)
//            })
//
//            return false
//        }
//        else {
//
//            return true
//        }

        return true
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {

        print("didSelectViewController -> \(tabBarController.tabBar.tag)")
    }

    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {

//        print("select-tag \(item.tag)")
//        print("selectedIndex \(self.selectedIndex)")
//        print("---------------------------")
    }
}

