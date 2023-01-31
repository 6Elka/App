//
//  MainTabBarController.swift
//  Insta
//
//  Created by Artem on 31.01.2023.
//

import UIKit

//MARK: - MainTabBarController
final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}
//MARK: - Private Init
extension MainTabBarController {
    private func initialize() {
        createSetTapBar()

        self.navigationItem.leftBarButtonItem = createLeftBarButtonItem()
        self.navigationItem.rightBarButtonItem = createRightBarButtonItem()
    }
    
    //MARK: - CreateSetTabBar
    private func createSetTapBar() {
        let house = createTabBar(viewController: HouseViewController(), title: "", image: "house")
        let search = createTabBar(viewController: SearchViewController(), title: "", image: "magnifyingglass")
        let story = createTabBar(viewController: StoryViewController(), title: "", image: "plus.square")
        let followers = createTabBar(viewController: FollowersViewController(), title: "", image: "heart")
        let profile = createTabBar(viewController: ProfileViewController(), title: "", image: "person.circle")
        
        viewControllers = [house, search, story, followers, profile]
    }
    
    //MARK: - CreateTabBar
    private func createTabBar(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let item = UITabBarItem(title: title, image: UIImage(systemName: image) , tag: 0)

        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem = item
        navController.navigationBar.tintColor = .white
        return navController
    }
    
    //MARK: - CreateLeftCustomView
    private func createLeftBarButtonItem() -> UIBarButtonItem {
        let logoView = UIBarButtonItem(customView: LogoView())
        return logoView
    }
    
    //MARK: - CreateRightCustomView
    private func createRightBarButtonItem() -> UIBarButtonItem {
        let button = UIBarButtonItem(customView: ButtonView())
        return button
    }
}

