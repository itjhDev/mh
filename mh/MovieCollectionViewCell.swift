//
//  MovieCollectionViewCell.swift
//  mh
//
//  Created by 宋立君 on 16/3/11.
//  Copyright © 2016年 itjh. All rights reserved.
//

import UIKit
import Spring
class MovieCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieImage: SpringImageView!

    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var cacegoryName: UILabel!
}
