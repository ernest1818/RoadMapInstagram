//
//  ReccomendationTableViewCell.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 18.10.2022.
//

import UIKit

/// Ячейка для реккомендаций
final class ReccomendationTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let storiesColorName = "storiesColor"
    }

    // MARK: - Private IBOutlets
    @IBOutlet private weak var firstContainerView: UIView!
    @IBOutlet private weak var secondContainerView: UIView!
    @IBOutlet private weak var therdContainerView: UIView!
    @IBOutlet private weak var fourContainerView: UIView!
    
    // MARK: - Life cycles
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        firstContainerView.layer.borderColor = UIColor(named: Constants.storiesColorName)?.cgColor
        secondContainerView.layer.borderColor = UIColor(named: Constants.storiesColorName)?.cgColor
        therdContainerView.layer.borderColor = UIColor(named: Constants.storiesColorName)?.cgColor
        fourContainerView.layer.borderColor = UIColor(named: Constants.storiesColorName)?.cgColor
    }
}
