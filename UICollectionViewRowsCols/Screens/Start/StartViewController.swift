//
//  StartViewController.swift
//  UICollectionViewRowsCols
//
//  Created by Damian Markowski on 28.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var items: [String] = ["1", "2", "3", "4",
                        "5", "6", "7", "8",
                        "9", "10", "11", "12",
                        "13", "14", "15", "16",
                        "17", "18"]
    private let cellIdentifier = "Cell"
    private let numberCellNibName = "NumberCell"
    private let numberOfColumns = 3
    private let numberOfRows = 6

    // MARK: Object lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setScreenTitle()
        configureCollectionView()
    }

    // MARK: Private methods

    private func setScreenTitle() {
        title = "CollectionView example"
    }

    private func configureCollectionView() {
        collectionView.register(UINib(nibName: numberCellNibName,
                                      bundle: nil),
                                forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension StartViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let numberCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                            for: indexPath) as? NumberCell
        guard let cell = numberCell else { return UICollectionViewCell() }
        cell.numberLabel.text = items[indexPath.row]
        return cell
    }
}

extension StartViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        guard let layout = flowLayout else { return CGSize.zero }
        let size = calculateCellSize(with: layout)
        return CGSize(width: size.width, height: size.height)
    }

    private func calculateCellSize(with layout: UICollectionViewFlowLayout) -> CGSize {
        let totalHorizontalSpace = layout.sectionInset.left
            + layout.sectionInset.right
            + (layout.minimumInteritemSpacing * CGFloat(numberOfColumns - 1))
        let totalVerticalSpace = layout.sectionInset.top
            + layout.sectionInset.bottom
            + (layout.minimumInteritemSpacing * CGFloat(numberOfRows - 1))
        let width = Int((collectionView.bounds.width - totalHorizontalSpace) / CGFloat(numberOfColumns))
        let height = Int((collectionView.bounds.height - totalVerticalSpace) / CGFloat(numberOfRows))
        return CGSize(width: width, height: height)
    }
}
