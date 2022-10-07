//
//  MainViewControllerTests.swift
//  Pictures everywhere! UiKitTests
//
//  Created by Guadalupe Vlček on 09/10/2022.
//

import XCTest
@testable import Pictures_everywhere__UiKit

class MainViewControllerTests: XCTestCase {
    var subject: MainViewController!
    private var presenter: MockMainViewControllerPresenter!

    override func setUp() {
        super.setUp()

        presenter = MockMainViewControllerPresenter()
        subject = MainViewController(presenter: presenter)
        _ = subject.view
    }
    
    func test_viewDidLoadCallsPresenterReloadPictures() {
        XCTAssertEqual(presenter.reloadDataCount, 1)
    }
    
    func test_PresenterSavePicture() {
        presenter.savePicture(data: Data(), coordinates: LocationCoordinates(latitude: 0, longitude: 0))
        XCTAssertEqual(presenter.isSaved, true)
    }
}

fileprivate class MockMainViewControllerPresenter: MainViewControllerPresenterProtocol {
    var reloadDataCount = 0
    func reloadPictures() {
        reloadDataCount += 1
    }
    
    var isSaved = false
    func savePicture(data: Data, coordinates: LocationCoordinates) {
        isSaved = true
    }
}
