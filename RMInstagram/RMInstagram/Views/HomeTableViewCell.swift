//
//  HomeTableViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 17.10.2022.
//

import UIKit

/// Ячейка для HomeTableView
final class HomeTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let userImageName = "1"
        static let likeText = "Нравиться: "
    }

    // MARK: - Private IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var contentImageView: UIImageView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var commentAvatarImageView: UIImageView!
    @IBOutlet private weak var discriptionLabel: UILabel!
    @IBOutlet private weak var likeCountLabel: UILabel!
    
    // MARK: - Public Methods
    func setupContent(_ content: Users) {
        nameLabel.text = content.name
        contentImageView.image = UIImage(named: content.contentImageName ?? "")
        avatarImageView.image = UIImage(named: content.userImageName ?? "")
        commentAvatarImageView.image = UIImage(named: Constants.userImageName)
        likeCountLabel.text = "\(Constants.likeText) \(content.contentLikeCount ?? 0)"
        discriptionLabel.text = (content.name ?? "") + " " + (content.contentDiscription ?? "")
        discriptionLabel.attributedText = setupDeliveryDateLabel(post: content)
    }
}

// MARK: - расширение для возможности делать отдельные части текста разной толщины
extension HomeTableViewCell {
    func setupDeliveryDateLabel(post: Users) -> NSMutableAttributedString {
        let secondText = "\(post.contentDiscription ?? "")"
        let myMutableString = NSMutableAttributedString(string:
                                                            "\(post.name ?? "") \(secondText)")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 14, weight: .bold),
            range: NSRange(location: 0, length: post.name?.count ?? 0)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 14, weight: .regular),
            range: NSRange(location: post.name?.count ?? 0, length: secondText.count)
        )
        return myMutableString
    }
}
