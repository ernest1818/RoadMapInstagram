//
//  FotoCollectionViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Ячейка для фото и видео контента
final class FotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private Outlet
    @IBOutlet private weak var contentImageView: UIImageView!
    
    // MARK: - Public Methods
    
    func configure(_ userProfile: String) {
        contentImageView.image = UIImage(named: userProfile)
    }
}
