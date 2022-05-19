//
//  MainCoordinator.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = CharactersListViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func characterListItemSelected(result: Result){
        let charactersDetailViewController = CharacterDetailsViewController.instantiate()
        charactersDetailViewController.coordinator = self
        charactersDetailViewController.charactersDetailViewModel = CharactersDetailViewModel(result:result)
        navigationController.pushViewController(charactersDetailViewController, animated: true)
    }
}
