//
//  MainNavigationViewController.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 08/10/2022.
//

import UIKit

class MainNavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // The main idea is to rely on dependency injection instead of singletons.
        let presenter = MainViewControllerPresenter(coreDataHelper: .init())
        let mainViewController = MainViewController(presenter: presenter)
        presenter.view = mainViewController
        pushViewController(mainViewController, animated: false)
    }
}
