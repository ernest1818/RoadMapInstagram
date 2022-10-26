//
//  TopicalCollectionViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Ячейка для актуальной истории
final class TopicalCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var topicalImageView: UIImageView!
    @IBOutlet private weak var topicalLabel: UILabel!
    
    // MARK: - PublicProperties
    
    func configure(_ text: String, _ imageName: String) {
        topicalLabel.text = text
        topicalImageView.layer.borderWidth = 2
        topicalImageView.layer.borderColor = UIColor.systemBackground.cgColor
        topicalImageView.image = UIImage(named: imageName)
    }
}
