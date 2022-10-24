//
//  FotoContentViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Ячейка с фото - видео контентом
final class FotoContentViewCell: UITableViewCell {
    
    private enum Constants {
        static let contentIdentifire = "contentItem"
    }

    // MARK: - Private IBOutlet
    @IBOutlet private weak var contentCollectionView: UICollectionView!
    
    // MARK: - Private properties
    private let profileInfo = UserProfile(topicalStories: TopicalStories())
    
    // MARK: - Lyfe Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createCollectionView()
    }
    
    private func createCollectionView() {
        contentCollectionView.dataSource = self
        contentCollectionView.layoutIfNeeded()
    }
}

// MARK: - UICollectionViewDataSource
extension FotoContentViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profileInfo.contentImageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let imageName = profileInfo.contentImageName[indexPath.row]
        guard
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.contentIdentifire,
                                                            for: indexPath) as? FotoCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        item.contentImageView.image = UIImage(named: imageName)
        return item
    }
}
