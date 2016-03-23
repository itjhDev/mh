//
//  HomeTableViewCell.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit 
import SDWebImage

import Log

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var groupName: UILabel!
	@IBOutlet weak var collectionView: UICollectionView!
}

extension HomeTableViewCell: UICollectionViewDataSource {

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as! MovieCollectionViewCell
        
		Log.info("https://o449xphwj.qnssl.com/img\(indexPath.row).jpg")
        
        
        cell.movieImage.setImageWithURL(NSURL(string: "https://o449xphwj.qnssl.com/img\(indexPath.row).jpg")!, placeholderImage: UIImage(named: "img3"))
 
        

		return cell
	}
}

extension HomeTableViewCell: UICollectionViewDelegateFlowLayout {

	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let itemWidth: CGFloat = 110
		let itemHeight = collectionView.bounds.height

		return CGSize(width: itemWidth, height: itemHeight)
	}
}
