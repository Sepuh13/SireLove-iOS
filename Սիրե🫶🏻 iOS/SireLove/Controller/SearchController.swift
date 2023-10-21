//
//  SearchController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class SearchController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

//MARK: - SwiftUI
import SwiftUI

struct SearchVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SearchVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: SearchVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SearchVCProvider.ContainerView>) {
        }
    }
}
