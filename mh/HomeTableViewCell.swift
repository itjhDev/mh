//
//  HomeTableViewCell.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Kingfisher

import Log

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

}

extension HomeTableViewCell : UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as! MovieCollectionViewCell
      
//        cell.movieImage.image = UIImage(named: "img\(indexPath.row)")
        
        Log.info("https://o40cqejff.qnssl.com/img\(indexPath.row).jpg")
        
//        print("https://o40cqejff.qnssl.com/img\(indexPath.row).jpg")
        
//        cell.movieImage.kf_setImageWithURL(NSURL(string: "https://o40cqejff.qnssl.com/img\(indexPath.row).jpg")!, placeholderImage: Image(named: "img3"))
//        
    
        cell.movieImage.kf_setImageWithURL(NSURL(string: "https://o40cqejff.qnssl.com/img\(indexPath.row).jpg")!, placeholderImage: UIImage(named: "img3"))
        
        
        return cell
    }
    
}


extension HomeTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
//        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        

        
        let itemWidth:CGFloat = 124

        
//        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
                let itemHeight = collectionView.bounds.height

        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
