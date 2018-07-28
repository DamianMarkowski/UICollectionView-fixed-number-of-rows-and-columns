//
//  StartViewControllerSnapshotTests.swift
//  UICollectionViewRowsColsSnapshotTests
//
//  Created by Damian Markowski on 28.07.2018.
//  Copyright © 2018 Damian Markowski. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
@testable import UICollectionViewRowsCols

class StartViewControllerSnapshotTests: FBSnapshotTestCase {

    var sut: StartViewController!

    override func setUp() {
        super.setUp()
        setUpViewController()
        recordMode = false
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

    func test_viewDidLoad_shouldDisplayScreenCorrectly() {
        FBSnapshotVerifyView(sut.view)
    }

}
