//
//  LikeTableViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 19.10.2022.
//

import UIKit

/// Ячейка с уведомлением о лайке на пост
final class LikeTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let blackWhiteColor = "blackColor"
        static let time = "2 минуты назад"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var likeLabel: UILabel!
    @IBOutlet private weak var contentImageView: UIImageView!
    
    // MARK: - Life cycles
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Public Methods
    func contentConfig(_ model: UsersNotifications) {
        userImageView.image = UIImage(named: model.userImageName )
        likeLabel.text = "\(model.userName) \(model.userAction.rawValue) \(model.time ?? "")"
        likeLabel.attributedText = setupDeliveryDateLabel(post: model)
        contentImageView.image = UIImage(named: model.contentImageName ?? "")
    }
    
    // MARK: - Private Methods
    private func setupDeliveryDateLabel(post: UsersNotifications) -> NSMutableAttributedString {
        let secondText = "\(post.userAction.rawValue)"
        let myMutableString = NSMutableAttributedString(string:
                                                            "\(post.userName) \(secondText) \(post.time ?? "")")
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 13, weight: .bold),
            range: NSRange(location: 0, length: post.userName.count)
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: UIFont.systemFont(ofSize: 13, weight: .regular),
            range: NSRange(location: post.userName.count, length: secondText.count)
        )
        
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor.lightGray,
            range: NSRange(location: post.userName.count + secondText.count + 2,
                           length: post.time?.count ?? 0)
        )
        return myMutableString
    }
    
    private func setupUI() {
        backgroundColor = UIColor(named: Constants.blackWhiteColor)
    }
    
}
