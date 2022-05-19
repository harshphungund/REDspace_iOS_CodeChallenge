//
//  ViewModel.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 17/05/22.
//

import Foundation

protocol CharactersListViewModellable{
    func loadCharacters(completion: @escaping () -> ())
    func numberOfItemsInSection(section: Int, isSearchControllerActive: Bool) -> Int
    func itemAtIndexPath(indexPath: IndexPath, isSearchControllerActive: Bool) -> Result
    func updateSearchResults(for searchText: String, completion: @escaping () -> ())
}

class CharactersListViewModel: NSObject, CharactersListViewModellable {
    
    var charactersService: CharactersServicable!
   private var results: [Result]?
    var charactersList = [Result]()
    var filteredCharactersList = [Result]()
    
    init(charactersServiceParam: CharactersServicable! = CharactersService()){
        self.charactersService = charactersServiceParam
    }
    
    func loadCharacters(completion: @escaping () -> ()){
        self.fetchCharacters {
            completion()
        }
    }
    
    func fetchCharacters(completion: @escaping () -> ()){
        charactersService.fetchCharacters(parameters: [:]) { [weak self] results  in
            if let results = results{
                self?.charactersList = results
            }
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int, isSearchControllerActive: Bool) -> Int{
        if  (isSearchControllerActive) {
            return filteredCharactersList.count
        }
        else {
            return charactersList.count
        }
    }
    
    func itemAtIndexPath(indexPath: IndexPath, isSearchControllerActive: Bool) -> Result{
            if (isSearchControllerActive) {
                return filteredCharactersList[indexPath.row]
            }
            else {
                return charactersList[indexPath.row]
            }
    }
    
    func updateSearchResults(for searchText: String, completion: @escaping () -> ()) {
        filteredCharactersList.removeAll(keepingCapacity: false)
        let array = charactersList.filter { result in
            if result.name!.localizedCaseInsensitiveContains(searchText){
                return true
            }
            return false
        }
        filteredCharactersList = array
        completion()
    }
}
