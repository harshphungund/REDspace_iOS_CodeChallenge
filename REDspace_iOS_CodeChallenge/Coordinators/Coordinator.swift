//
//  AppCoordinator.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import UIKit
import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
//
//class AppCoordinator {
//    private let navigationController = UINavigationController()
//
//        var rootViewController: UIViewController {
//            return navigationController
//        }
//    
//    func start() {
//        showCharactersList()
//    }
//    
//    private func showCharactersList() {
//        guard let charactersListViewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "CharactersListViewController") as? CharactersListViewController else {
//            fatalError("Unable to Instantiate Characters List View Controller")
//        }
//        navigationController.pushViewController(charactersListViewController, animated: true)
//    }
//}
