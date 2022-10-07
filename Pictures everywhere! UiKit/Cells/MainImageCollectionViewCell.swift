//
//  MainImageCollectionViewCell.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 06/10/2022.
//

import UIKit

class MainImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    func populate(picture: Picture) {
        guard let currentPicture = picture.img else { return }
        image.image = UIImage(data: currentPicture)
    }
}
