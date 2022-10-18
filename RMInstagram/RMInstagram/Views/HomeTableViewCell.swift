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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var commentAvatarImageView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
}
