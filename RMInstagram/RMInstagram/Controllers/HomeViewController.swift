//
//  ViewController.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 17.10.2022.
//

import UIKit

///  Экран ленты приложения
final class HomeViewController: UIViewController {
    
    private enum Constants {
        static let segueIdentifire = "stories"
        static let cellIdentifire = "oneCell"
        static let scrollCellIdentifire = "scrollCell"
        static let firstUserName = "valka.kalash"
        static let userImageName = "1"
        static let firstUsersImageName = "scroll1"
        static let firstContentImageName = "11"
        static let firstContentDiscription = "как тебе такое Илон Маск"
        static let firstName = "liza.boss"
        static let firstAvatarImageName = "3"
        static let firstContentLikeCount = 123
        static let secondUserName = "moroz.pochyi"
        static let therdUserName = "garri.gudini777"
        static let fourUserName = "siniy_papa"
        static let secondUsersImageName = "scroll2"
        static let therdUsersImageName = "scroll3"
        static let fourUsersImageName = "scroll4"
        static let secondContentImageName = "6"
        static let therdContentImageName = "7"
        static let fourContentImageName = "8"
        static let secondContentDiscription = "к тебе все придет, как только ты все отпустишь"
        static let therdContentDiscription = "дорогу осилит идущий"
        static let fourContentDiscription = "вода камень точит"
        static let secondContentLikeCount = 20
        static let therdContentLikeCount = 349
        static let fourContentLikeCount = 890
        static let storiesColorName = "storiesColor"
        static let borderdColorName = "myLightGray"
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var homeTableView: UITableView!
    @IBOutlet private weak var firstNameLabel: UILabel!
    @IBOutlet private weak var myImageView: UIImageView!
    
    // MARK: - Private variables
    private var users: [Users] = [Users(name: Constants.firstUserName,
                                        userImageName: Constants.firstUsersImageName,
                                        contentImageName: Constants.firstContentImageName,
                                        contentDiscription: Constants.firstContentDiscription,
                                        contentLikeCount: Constants.firstContentLikeCount),
                                  Users(name: Constants.secondUserName,
                                        userImageName: Constants.secondUsersImageName,
                                        contentImageName: Constants.secondContentImageName,
                                        contentDiscription: Constants.secondContentDiscription,
                                        contentLikeCount: Constants.secondContentLikeCount),
                                  Users(name: Constants.therdUserName,
                                        userImageName: Constants.therdUsersImageName,
                                        contentImageName: Constants.therdContentImageName,
                                        contentDiscription: Constants.therdContentDiscription,
                                        contentLikeCount: Constants.therdContentLikeCount),
                                  Users(name: Constants.fourUserName,
                                        userImageName: Constants.fourUsersImageName,
                                        contentImageName: Constants.fourContentImageName,
                                        contentDiscription: Constants.fourContentDiscription,
                                        contentLikeCount: Constants.fourContentLikeCount)]
    private let refresh = UIRefreshControl()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constants.segueIdentifire else { return }
        guard
            let storiesVC = segue.destination as? StoriesViewController
        else {
            return
        }
        storiesVC.nameText = Constants.firstName
        storiesVC.imageName = Constants.firstAvatarImageName
        
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createTableView()
        createProfile()
        createRefresh()
        createFirstLabel()
    }
    
    private func createFirstLabel() {
        firstNameLabel.text = Constants.firstName
    }
    
    private func createTableView() {
        homeTableView.dataSource = self
        homeTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func createProfile() {
        myImageView.image = UIImage(named: Constants.userImageName)
    }
    
    private func createRefresh() {
        refresh.addTarget(self, action: #selector(refreshedAction), for: .valueChanged)
        homeTableView.addSubview(refresh)
    }
    
    @objc private func refreshedAction() {
        homeTableView.reloadData()
        refresh.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            guard
                let scrollCell = tableView.dequeueReusableCell(withIdentifier: Constants.scrollCellIdentifire,
                                                             
                                                             for: indexPath) as? ReccomendationTableViewCell
            else { return UITableViewCell() }
            return scrollCell
            
        } else {
            
            guard
                
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifire,
                                                         for: indexPath) as? HomeTableViewCell
            else {
                return UITableViewCell()
            }
            cell.setupContent(users[indexPath.row])
            return cell
        }
    }
}
