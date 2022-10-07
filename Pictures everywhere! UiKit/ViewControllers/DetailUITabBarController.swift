//
//  DetailUITabBarController.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 07/10/2022.
//

import UIKit

enum TabBarItemsOrder: Int {
    case picture
    case location
}

class DetailUITabBarController: UITabBarController {
    var picture: Picture
    
    init(picture: Picture) {
        self.picture = picture
        super.init(nibName: DetailUITabBarController.identifier, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllers = [PictureViewController(), LocationViewController()]
        setViewControllers(controllers, animated: true)
        
        self.title = picture.date
        
        tabBar.tintColor = .black
        tabBar.items?[TabBarItemsOrder.picture.rawValue].title = "TabBar_picture".localized()
        tabBar.items?[TabBarItemsOrder.picture.rawValue].image = UIImage(systemName: "person.crop.artframe")
        tabBar.items?[TabBarItemsOrder.location.rawValue].title = "TabBar_location".localized()
        tabBar.items?[TabBarItemsOrder.location.rawValue].image = UIImage(systemName: "mappin")
        
        //back button setup
        let backButton = UIBarButtonItem(image: UIImage(named: "icn_back"), style: .plain, target: self, action: #selector(back))
        backButton.tintColor = .darkGray
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func back(sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
}
