//
//  CharactersListViewControllerExtensions.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import Foundation
import UIKit

extension CharactersListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersListViewModel.numberOfItemsInSection(section: section, isSearchControllerActive: resultSearchController.isActive)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CharacterTableViewCell
        cell.configureCellForItem(result: charactersListViewModel.itemAtIndexPath(indexPath: indexPath, isSearchControllerActive: resultSearchController.isActive))
        cell.layoutSubviews()
        return cell
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.keyboardDismissMode = .onDrag
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.characterListItemSelected(result: charactersListViewModel.itemAtIndexPath(indexPath: indexPath, isSearchControllerActive: resultSearchController.isActive))
    }
}

