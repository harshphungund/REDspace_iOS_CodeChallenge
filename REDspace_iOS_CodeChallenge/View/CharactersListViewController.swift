//
//  CharactersListViewController.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 17/05/22.
//

import UIKit


class CharactersListViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var charactersListViewModel : CharactersListViewModellable! = CharactersListViewModel()
    var resultSearchController  = UISearchController()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialUI()
        charactersListViewModel.loadCharacters {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setInitialUI(){
        navigationItem.title = AppConstants.kCharacters
        // Do any additional setup after loading the view.
        resultSearchController = UISearchController(searchResultsController: nil)
        resultSearchController.searchResultsUpdater = self
        resultSearchController.searchBar.delegate = self
        resultSearchController.searchBar.sizeToFit()
        resultSearchController.isActive = false
        self.definesPresentationContext = true
        tableView.tableHeaderView = resultSearchController.searchBar
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        charactersListViewModel.updateSearchResults(for: searchController.searchBar.text!) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
