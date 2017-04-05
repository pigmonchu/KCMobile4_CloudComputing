//
//  NewsCollectionViewCell.swift
//  Scoop
//
//  Created by pigmonchu on 4/4/17.
//  Copyright © 2017 pigmonchu. All rights reserved.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
