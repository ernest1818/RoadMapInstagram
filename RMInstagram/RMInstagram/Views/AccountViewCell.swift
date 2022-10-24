//
//  AccountViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Ячейка с фото юзера и колличеством подписоки подписчиков
final class AccountViewCell: UITableViewCell {
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var avatarButton: UIButton!
    
    // MARK: - Life Cycles
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createGradientView()
    }
    
    private func createGradientView() {
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: .zero, size: gradientView.frame.size)
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.red.cgColor, UIColor.systemYellow.cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradientView.layer.addSublayer(gradient)
        gradientView.addSubview(avatarButton)
    }
}
