//
//  MainViewControllerPresenterTests.swift
//  Pictures everywhere! UiKitTests
//
//  Created by Guadalupe Vlček on 09/10/2022.
//

import XCTest
@testable import Pictures_everywhere__UiKit

class MainViewControllerPresenterTests: XCTestCase {
    fileprivate var view: MockView!
    fileprivate var subject: MainViewControllerPresenter!

    override func setUp() {
        super.setUp()

        view = MockView()

        subject = MainViewControllerPresenter(coreDataHelper: CoreDataHelper())
        subject.view = view
    }
    
    override func tearDown() {
        super.tearDown()

        view = nil
        subject = nil
    }
    
    func test_loadData() {
        subject.reloadPictures()

        XCTAssertEqual(view.isDataLoaded, true)
    }
}

fileprivate class MockView: MainViewControllerProtocol {
    var isDataLoaded = false
    func loadPictures(pictures: [Picture]) {
        isDataLoaded = true
    }
}
