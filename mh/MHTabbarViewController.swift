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
                return NSLocalizedString("Home1", comment: "")
            }
        }
    }

    private var previousTab = Tab.Home

    private var checkDoubleTapOnHomeTimer: NSTimer?

    private var hasFirstTapOnFeedsWhenItIsAtTop = false {
        willSet {
            if newValue {
                let timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(MHTabbarViewController.checkDoubleTapOnFeeds(_:)), userInfo: nil, repeats: false)
                checkDoubleTapOnHomeTimer = timer
            } else {
                checkDoubleTapOnHomeTimer?.invalidate()
            }
        }
    }

    @objc private func checkDoubleTapOnFeeds(timer: NSTimer) {

        hasFirstTapOnFeedsWhenItIsAtTop = false
    }

    private struct Listener {
        static let lauchStyle = "YepTabBarController.lauchStyle"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        // Set Titles

        if let items = tabBar.items {
            for i in 0 ..< items.count {
                let item = items[i]
                item.title = Tab(rawValue: i)?.title
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITabBarControllerDelegate

extension MHTabbarViewController: UITabBarControllerDelegate {

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {

        guard
        let tab = Tab(rawValue: selectedIndex),
            let nvc = viewController as? UINavigationController else {

                return false
        }

        if tab != previousTab {
            return true
        }
        
        if case .Home = tab {
//           hasFirstTapOnFeedsWhenItIsAtTop = true
//            return false
        }
        
        return true
    }

    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {

        guard
        let tab = Tab(rawValue: selectedIndex),
            let nvc = viewController as? UINavigationController else {
                return
        }

        // 不相等才继续，确保第一次 tap 不做事

        if tab != previousTab {
            previousTab = tab
            return
        }

        switch tab {
        case .Home:
            print("双击")
            hasFirstTapOnFeedsWhenItIsAtTop = false
        }
    }
}

