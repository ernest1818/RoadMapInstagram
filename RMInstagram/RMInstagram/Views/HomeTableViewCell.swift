//
//  HomeTableViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 17.10.2022.
//

import UIKit

/// Ячейка для HomeTableView
final class HomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var commentAvatarImageView: UIImageView!
    @IBOutlet private weak var discriptionLabel: UILabel!
    @IBOutlet private weak var likeCountLabel: UILabel!
}
