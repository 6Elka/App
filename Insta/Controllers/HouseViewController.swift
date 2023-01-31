//
//  HouseViewController.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import UIKit

//MARK: - HouseViewController
final class HouseViewController: UIViewController {
    
    //MARK: - Table
    private let tableView = UITableView().createTable()
    
    //MARK: - Enum
    private enum Constants {
        static let heightForRowTable: CGFloat = 435
        static let heightCollection: CGFloat = 125
        static let heightReccomendCollection: CGFloat = 270
    }
    
    //MARK: - Refresh Control
    private let refreshControl = UIRefreshControl().createRefresh()
    
    //MARK: - DataStoryAndPost
    private var items: [TypeStoryOrPost] = [
        .stories([
            StoryCellItem(image: "one", userName: "pashka"),
            StoryCellItem(image: "two", userName: "dashka"),
            StoryCellItem(image: "five", userName: "nevalashka"),
            StoryCellItem(image: "three", userName: "andurshka"),
            StoryCellItem(image: "four", userName: "cheburashka"),
            StoryCellItem(image: "two", userName: "dashka"),
            StoryCellItem(image: "five", userName: "nevalashka"),
            StoryCellItem(image: "two", userName: "dashka"),
            StoryCellItem(image: "one", userName: "pashka")]),
        .posts([
            PostCellItem(userImage: "two", userName: "Some_world", postSubtitle: "Sponsored", postImage: "five", numberOfLikes: 123, comment: CommentFollowers(userName: "Someone", userComment: "It's beautiful")),
            PostCellItem(userImage: "five", userName: "World", postSubtitle: "Crazy view", postImage: "one", numberOfLikes: 59, comment: CommentFollowers(userName: "Anyone", userComment: "It's amazing"))]),
        .recommend([
            RecommendItem(userImage: "2", userName: "pavlik12"),
            RecommendItem(userImage: "3", userName: "biorn_06"),
            RecommendItem(userImage: "1", userName: "kris01")
        ])
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
//MARK: - Private Init
extension HouseViewController {
    private func initialize() {
       
        //MARK: - Refresh
        refreshControl.addTarget(self, action: #selector(activRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        //MARK: - Table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PostsTableCell.self, forCellReuseIdentifier: String(describing: PostsTableCell.self))
        tableView.register(StoryTableCell.self, forCellReuseIdentifier: String(describing: StoryTableCell.self))
        tableView.register(RecommendTableCell.self, forCellReuseIdentifier: String(describing: RecommendTableCell.self))
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    @objc func activRefresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }
}

//MARK: - Table Delegate
extension HouseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = items[indexPath.row]
        switch index {
        case .stories(let story):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoryTableCell.self), for: indexPath) as! StoryTableCell
            cell.configure(info: story)
            cell.backgroundColor = .white
            return cell
        case .posts(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PostsTableCell.self), for: indexPath) as! PostsTableCell
            cell.configure(info: post[indexPath.row])
            return cell
        case .recommend(let reccom):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RecommendTableCell.self), for: indexPath) as! RecommendTableCell
            cell.configure(info: reccom)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = items[indexPath.row]
        
        switch index {
        case .stories(_):
            return Constants.heightCollection
        case .posts(_):
            return Constants.heightForRowTable
        case .recommend(_):
            return Constants.heightReccomendCollection
        }
    }
}
