//
//  TabBarViewController.swift
//  AwesomeSwift
//
//  Created by Matteo Crippa on 8/4/16.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Debug
import UIKit

// MARK: - Repository
public enum RepositoryType {
    case awesomeSwift
    case osApp
}

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // set contents
        // swiftlint:disable:next force_cast
        let favorites = Storyboard.list.vc as! ListViewController
        favorites.isFavorite = true
        let iconFav = UITabBarItem(title: "Favorites",
                                   image: UIImage(named: "favorite"),
                                   selectedImage: UIImage(named: "favorite"))
        favorites.tabBarItem = iconFav

        // swiftlint:disable:next force_cast
        let listSwift = Storyboard.list.vc as! ListViewController
        listSwift.api = .awesomeSwift
        let iconSwift = UITabBarItem(title: "Swift",
                                     image: UIImage(named: "repos"),
                                     selectedImage: UIImage(named: "repos"))
        listSwift.tabBarItem = iconSwift

        // swiftlint:disable:next force_cast
        let listOSA = Storyboard.list.vc as! ListViewController
        listOSA.api = .osApp
        let iconOSA = UITabBarItem(title: "OS Apps",
                                   image: UIImage(named: "repos"),
                                   selectedImage: UIImage(named: "repos"))
        listOSA.tabBarItem = iconOSA


        let credits = Storyboard.credits.vc
        let iconCredits = UITabBarItem(title: "Credits",
                                       image: UIImage(named: "credits"),
                                       selectedImage: UIImage(named: "credits"))
        credits!.tabBarItem = iconCredits


        // add view controller
        viewControllers = [
            favorites.embedInNavigation(),
            listSwift.embedInNavigation(),
            listOSA.embedInNavigation(),
            credits!.embedInNavigation()
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

// MARK: - TabBar delegate
extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        Debug.print("Should select viewController: \(viewController)")
        return true
    }
}
