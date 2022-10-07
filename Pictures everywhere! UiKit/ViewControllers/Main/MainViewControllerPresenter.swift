//
//  MainViewControllerPresenter.swift
//  Pictures everywhere! UiKit
//
//  Created by Guadalupe Vlček on 08/10/2022.
//

import Foundation
import CoreLocation


class MainViewControllerData {
    var pictures: [Picture]
    var updatedCoordinates: LocationCoordinates
    var locationManager: CLLocationManager
    
    init(pictures: [Picture], updatedCoordinates: LocationCoordinates, locationManager: CLLocationManager) {
        self.pictures = pictures
        self.updatedCoordinates = updatedCoordinates
        self.locationManager = locationManager
    }
}

protocol MainViewControllerProtocol: AnyObject {
    func loadPictures(pictures: [Picture])
}

class MainViewControllerPresenter: MainViewControllerPresenterProtocol {
    weak var view: MainViewControllerProtocol?
    private let coreDataHelper: CoreDataHelper

    init(coreDataHelper: CoreDataHelper) {
        self.coreDataHelper = coreDataHelper
    }

    func reloadPictures() {
        let pictures = coreDataHelper.fetchPictures().reversed() as [Picture]
        view?.loadPictures(pictures: pictures)
    }
    
    func savePicture(data: Data, coordinates: LocationCoordinates) {
        coreDataHelper.savePicture(data: data, coordinates: coordinates)
    }
}

extension MainViewControllerData {
    convenience init() {
        self.init(pictures: [], updatedCoordinates: Constants.defaultCoordinates, locationManager: CLLocationManager())
    }
}
