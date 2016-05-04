//
//  HomeTableViewCell.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit

import Log

import SpriteKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var collectionView: SpringView!
}

extension HomeTableViewCell: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as! MovieCollectionViewCell

        cell.movieImage.yy_setImageWithURL(NSURL(string: "https://o449xphwj.qnssl.com/img\(indexPath.row).jpg")!, options: [.ProgressiveBlur, .SetImageWithFadeAnimation])

//        cell.movieImage.animation = "pop"
//        cell.movieImage.curve = "spring"
//        cell.movieImage.duration = 1.0
//        cell.movieImage.animate()

        return cell
    }
}

extension HomeTableViewCell: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        Log.info("点击了第\(indexPath.row)")

//        self.collectionView.animation = "pop"
//
//        self.collectionView.curve = "spring"
//
//        self.collectionView.duration = 2.0
//
//        self.collectionView.animate()

//        self.collectionView.

        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! MovieCollectionViewCell

        cell.movieImage.animation = "pop"
        cell.movieImage.curve = "spring"
        cell.movieImage.duration = 2.0 // 速度
//        cell.movieImage.scaleX = 1
//        cell.movieImage.scaleY = 1
        cell.movieImage.force = 0.5 // 幅度
        cell.movieImage.animate()
    }
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemWidth: CGFloat = 110
        let itemHeight = collectionView.bounds.height

        return CGSize(width: itemWidth, height: itemHeight)
    }
}
