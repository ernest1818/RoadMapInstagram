//
//  NotificationViewController.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 19.10.2022.
//

import UIKit

/// Экран уведомлений
class NotificationViewController: UIViewController {
    
    private enum TableSectionTypes: Comparable {
        case today
        case yesterday
        case lastWeek
        case thisMonth
        case previously
    }
    
    private enum TableCellsTypes {
        case likeCell
        case followCell
    }
    
    private enum Constants {
        static let likeIdentifire = "likeCell"
        static let followIdentifire = "followCell"
        static let today = "Сегодня"
        static let yesterday = "Вчера"
        static let lastWeek = "На прошлой неделе"
        static let thisMonth = "В этом месяце"
        static let previously = "Ранее"
        
        static let firstUserName = "valka.kalash"
        static let userImageName = "1"
        static let firstUsersImageName = "scroll1"
        static let firstContentImageName = "11"
        static let firstContentDiscription = "как тебе такое Илон Маск"
        static let secondUserName = "moroz.pochyi"
        static let therdUserName = "garri.gudini777"
        static let fourUserName = "siniy_papa"
        static let secondUsersImageName = "scroll2"
        static let therdUsersImageName = "scroll3"
        static let fourUsersImageName = "scroll4"
        static let secondContentImageName = "6"
        static let therdContentImageName = "7"
        static let fourContentImageName = "8"
        static let whiteBlackColor = "myWhiteColor"
        static let time = "2 минуты назад"
    }
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var notificationTableView: UITableView!
    
    // MARK: - private variables
    private let sectionTypes: [TableSectionTypes] = [.today, .yesterday, .lastWeek, .thisMonth, .previously]
    
    private let cellTypes: [TableCellsTypes] = [.likeCell, .followCell]
    
    private let userNotification: [UsersNotifications] = [
        UsersNotifications(userName: Constants.firstUserName,
                           userImageName: Constants.firstUsersImageName,
                           userAction: .following,
                           contentImageName: Constants.firstContentImageName,
                           time: Constants.time),
        UsersNotifications(userName: Constants.secondUserName,
                           userImageName: Constants.secondUsersImageName,
                           userAction: .likeComment,
                           contentImageName: Constants.secondContentImageName,
                           time: Constants.time),
        UsersNotifications(userName: Constants.therdUserName,
                           userImageName: Constants.therdUsersImageName,
                           userAction: .likePhoto,
                           contentImageName: Constants.therdContentImageName,
                           time: Constants.time),
        UsersNotifications(userName: Constants.fourUserName,
                           userImageName: Constants.fourUsersImageName,
                           userAction: .prioritetFollow,
                           contentImageName: Constants.fourContentImageName,
                           time: Constants.time)
    ]
    
    private let refresh = UIRefreshControl()
    
    // MARK: - Life Cycles
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
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.rowHeight = UITableView.automaticDimension
        notificationTableView.allowsSelection = false
    }
    
    private func createRefresh() {
        refresh.addTarget(self, action: #selector(refreshedAction), for: .valueChanged)
        notificationTableView.addSubview(refresh)
    }
    
    @objc private func refreshedAction() {
        refresh.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension NotificationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTypes.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let type = sectionTypes[section]
        
        switch type {
        case .today:
            return 1
        case .yesterday:
            return 2
        case .lastWeek...:
            return userNotification.count
        default:
            break
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let notificationTypes = userNotification[indexPath.row]
        let actionType = userNotification[indexPath.row].userAction
        
        switch indexPath.row {
        case 1:
            if actionType == .likePhoto || actionType == .likeComment {
                guard
                    let likeCell = tableView.dequeueReusableCell(withIdentifier: Constants.likeIdentifire,
                                                                 for: indexPath) as? LikeTableViewCell
                else { return UITableViewCell() }
//                likeCell.backgroundColor = .black
                likeCell.contentConfig(notificationTypes)
                return likeCell
            } else {
                guard let followCell = tableView.dequeueReusableCell(withIdentifier: Constants.followIdentifire,
                                                                     for: indexPath) as? FollowCell
                else { return UITableViewCell() }
//                followCell.backgroundColor = .black
                followCell.configurationFollowCell(notificationTypes)
                return followCell
            }
        case 0, 2...:
            if actionType == .following || actionType == .prioritetFollow {
                
                guard let followCell = tableView.dequeueReusableCell(withIdentifier: Constants.followIdentifire,
                                                                     for: indexPath) as? FollowCell
                else { return UITableViewCell() }
                followCell.configurationFollowCell(notificationTypes)
                return followCell
            } else {
                guard
                    let likeCell = tableView.dequeueReusableCell(withIdentifier: Constants.likeIdentifire,
                                                                 for: indexPath) as? LikeTableViewCell
                else { return UITableViewCell() }
                likeCell.contentConfig(notificationTypes)
                return likeCell
            }
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let type = sectionTypes[section]
        switch type {
        case .today:
            return Constants.today
        case .yesterday:
            return Constants.yesterday
        case .lastWeek:
            return Constants.lastWeek
        case .thisMonth:
            return Constants.thisMonth
        case .previously:
            return Constants.previously
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 20
        case 1, 2...:
            return 5
        default:
            break
        }
        return 5
    }
    
}

// MARK: - UITableViewDelegate
extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.text = headerView.textLabel?.text?.capitalizedSentence
        headerView.textLabel?.textColor = UIColor(named: Constants.whiteBlackColor)
        headerView.textLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
    }
}

// MARK: - String добавили метод изменяющий строку, устанавливая заглавной лишь первую букву
extension String {
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
}
