//
//  HomeTableViewCell.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit

import Log

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let animationController = DAExpandAnimation()

}

extension HomeTableViewCell: UICollectionViewDataSource {
    


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as! MovieCollectionViewCell
        

        cell.movieImage.yy_setImageWithURL(NSURL(string: "https://o449xphwj.qnssl.com/img\(indexPath.row).jpg")!, options: [.ProgressiveBlur,.SetImageWithFadeAnimation])

        return cell
    }
    
    
}


extension HomeTableViewCell: UICollectionViewDelegate{
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        Log.info("点击了第\(indexPath.row)")
        
        
        animationController.collapsedViewFrame = {
            Log.info("ddd")
            return self.frame
        }
        
        animationController.animationDuration = 1.0
        
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animationController
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animationController
    }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemWidth: CGFloat = 110
        let itemHeight = collectionView.bounds.height

        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
