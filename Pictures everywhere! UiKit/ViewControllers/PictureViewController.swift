//
//  PictureViewController.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 07/10/2022.
//

import UIKit

class PictureViewController: UIViewController {
    @IBOutlet weak var pictureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabView = tabBarController as? DetailUITabBarController
        let picture = tabView?.picture
        
        guard let picture = picture?.img else { return }
        pictureImage.image = UIImage(data: picture)
    }
}
