//
//  MainTabBarController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let homeController = HomeController()
        let collectionsController = CollectionsController()
        let meController = MeController()
        let searchController = SearchController()
        let moreController = MoreController()
        
        tabBar.tintColor = .mainBlue()
        
        let homeImage = UIImage(named: "mainTabBar1")
        let collectionsImage = UIImage(named: "mainTabBar2")
        let meImage = UIImage(named: "mainTabBar3")
        let searchImage = UIImage(named: "mainTabBar4")
        let moreImage = UIImage(named: "mainTabBar5")
        
        viewControllers = [
            generateNavigationController(rootViewController: homeController, title: "Home", image: homeImage!),
            generateNavigationController(rootViewController: collectionsController, title: "Collections", image: collectionsImage!),
            generateNavigationController(rootViewController: meController, title: "Me", image: meImage!),
            generateNavigationController(rootViewController: searchController, title: "Search", image: searchImage!),
            generateNavigationController(rootViewController: moreController, title: "More", image: moreImage!)
        ]
    }
    
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

//MARK: Swift UI

import SwiftUI

struct MainTabBarVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let mainTabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainTabBarVCProvider.ContainerView>) -> MainTabBarController {
            return mainTabBarVC
        }
        
        func updateUIViewController(_ uiViewController: MainTabBarVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainTabBarVCProvider.ContainerView>) {
        }
    }
}
