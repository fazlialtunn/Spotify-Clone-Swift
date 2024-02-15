//
//  TabBarViewController.swift
//  Spotify-Clone
//
//  Created by Fazlı Altun on 1.01.2024.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let HomeVC = HomeViewController()
        let SearchVC = SearchViewController()
        let LibraryVC = LibraryViewController()
        
        HomeVC.title = "Browse" 
        SearchVC.title = "Search"
        LibraryVC.title = "Library"
        
        HomeVC.navigationItem.largeTitleDisplayMode = .always
        SearchVC.navigationItem.largeTitleDisplayMode = .always
        LibraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: HomeVC)
        let nav2 = UINavigationController(rootViewController: SearchVC)
        let nav3 = UINavigationController(rootViewController: LibraryVC)
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: false)
    }
}
