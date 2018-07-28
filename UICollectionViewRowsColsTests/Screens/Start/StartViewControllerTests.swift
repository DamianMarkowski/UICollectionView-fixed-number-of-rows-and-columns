//
//  StartViewControllerTests.swift
//  UICollectionViewRowsColsTests
//
//  Created by Damian Markowski on 28.07.2018.
//  Copyright © 2018 Damian Markowski. All rights reserved.
//

import XCTest
@testable import UICollectionViewRowsCols

class StartViewControllerTests: XCTestCase {

    var sut: StartViewController!

    override func setUp() {
        super.setUp()
        setUpViewController()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    private func setUpViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController
        guard let viewController = screen else { return }
        sut = viewController
        sut.loadViewIfNeeded()
    }

    func test_viewDidLoad_shouldSetCorrectScreenTitle() {
        XCTAssertEqual(sut.title, "CollectionView example")
    }

    func test_viewDidLoad_shouldInitializeCollectionView() {
        XCTAssertNotNil(sut.collectionView)
    }

    func test_viewDidLoad_shouldCollectionViewHaveOneSection() {
        XCTAssertEqual(sut.collectionView.numberOfSections, 1)
    }

    func test_viewDidLoad_shouldCollectionViewHave18Items() {
        XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 18)
    }

    func test_cellForItem_shouldBeOfTypeNumberCell() {
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = sut.collectionView(sut.collectionView,
                                      cellForItemAt: indexPath)
        XCTAssertTrue(cell is NumberCell)
    }

}
