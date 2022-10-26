//
//  SearchViewController.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import UIKit

/// Экран отображающий страницу юзера
final class SearchViewController: UIViewController {

    private enum Constants {
        static let accountIdentifire = "accountCell"
        static let discriptionIdentifire = "discriptionCell"
        static let topicalIdentifire = "topicalCell"
        static let contentIdentifire = "contentCell"
        static let xibFileName = "DiscriptionViewCell"
    }
    
    private enum TableCellType {
        case accountCell
        case discriptionCell
        case topicalCell
        case contentCell
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet weak var searchTableView: UITableView!
    
    // MARK: - Private Visual Component
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private Properties
    private let cellTypes: [TableCellType] = [.accountCell, .discriptionCell, .topicalCell, .contentCell]
  
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods
    private func setupUI() {
        createTableView()
        createRefresh()
    }
    
    private func createTableView() {
        searchTableView.dataSource = self
        searchTableView.register(UINib(nibName: Constants.xibFileName, bundle: Bundle.main),
                                 forCellReuseIdentifier: Constants.discriptionIdentifire)
        searchTableView.estimatedRowHeight = UITableView.automaticDimension
        searchTableView.allowsSelection = false
    }
    
    private func createRefresh() {
        refreshControl.addTarget(self, action: #selector(refreshedAction), for: .valueChanged)
        searchTableView.addSubview(refreshControl)
    }
    
    @objc private func refreshedAction() {
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = cellTypes[indexPath.row]
        switch type {
        case .accountCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.accountIdentifire,
                                                           for: indexPath) as? AccountViewCell
            else {
                return UITableViewCell()
            }
            return cell
        case .discriptionCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.discriptionIdentifire,
                                                           for: indexPath) as? DiscriptionViewCell
            else {
                return UITableViewCell()
            }
            return cell
        case .topicalCell:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.topicalIdentifire,
                                                           for: indexPath) as? TopicalViewCell
            else {
                return UITableViewCell()
            }
            return cell
        case .contentCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.contentIdentifire,
                                                            for: indexPath) as? FotoContentViewCell
             else {
                 return UITableViewCell()
             }
             return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
