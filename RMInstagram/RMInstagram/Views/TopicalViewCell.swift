//
//  TopicalViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Ячейка с коллекцией историй
final class TopicalViewCell: UITableViewCell {

    private enum Constants {
        static let topicalIdentifire = "topicalItem"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private properties
    private let profileInfo = UserProfile(topicalStories: TopicalStories())
    
    // MARK: - LifeCycles
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension TopicalViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profileInfo.topicalStories.name.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let text = profileInfo.topicalStories.name[indexPath.row]
        let imageName = profileInfo.topicalStories.imageName[indexPath.row]
        
       guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.topicalIdentifire,
                                                      for: indexPath) as? TopicalCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        item.configure(text, imageName)
        return item
    }
}
