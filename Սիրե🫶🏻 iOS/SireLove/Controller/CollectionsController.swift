//
//  CollectionsController.swift
//  SireLove
//
//  Created by Er Baghdasaryan on 04.09.23.
//

import UIKit

final class CollectionsController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}

//MARK: - SwiftUI
import SwiftUI

struct CollectionsVCProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CollectionsVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: CollectionsVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<CollectionsVCProvider.ContainerView>) {
        }
    }
}
