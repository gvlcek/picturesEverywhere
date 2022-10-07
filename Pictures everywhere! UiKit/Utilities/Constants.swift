//
//  Constants.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 08/10/2022.
//

import Foundation
import UIKit

struct Constants {
    static let coreDataEntity: String = "Picture"
    static let defaultCoordinates = LocationCoordinates(latitude: 0, longitude: 0)
    
    struct Storyboards {
        static let main: String = "Main"
    }
    
    struct MainViewController {
        static let collectionColumns = CGFloat(3)
    }
}
