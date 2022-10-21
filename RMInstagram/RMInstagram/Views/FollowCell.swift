//
//  FollowCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 19.10.2022.
//

import UIKit

/// Ячейка уведомлений о подписчиках
final class FollowCell: UITableViewCell {
    
    private enum Constants {
        static let blackWhiteColor = "blackColor"
    }
    
    // MARK: - Public IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var followLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Life cycles
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Public Methods
    func configurationFollowCell(_ model: UsersNotifications) {
        userImageView.image = UIImage(named: model.userImageName)
        followLabel.text = "\(model.userName) \(model.userAction.rawValue) \(model.time ?? "")"
        followLabel.attributedText = setupDeliveryDateLabel(post: model)
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
