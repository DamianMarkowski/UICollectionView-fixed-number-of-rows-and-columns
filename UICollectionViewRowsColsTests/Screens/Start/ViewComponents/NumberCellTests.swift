//
//  NumberCellTests.swift
//  UICollectionViewRowsColsTests
//
//  Created by Damian Markowski on 28.07.2018.
//  Copyright © 2018 Damian Markowski. All rights reserved.
//

import XCTest
@testable import UICollectionViewRowsCols

class NumberCellTests: XCTestCase {

    var sut: NumberCell!

    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: NumberCell.self)
        let nib = bundle.loadNibNamed("NumberCell", owner: nil, options: nil)
        sut = nib?.first as? NumberCell
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_init_numberLabel_shouldNotBeNil() {
        XCTAssertNotNil(sut.numberLabel)
    }

}
