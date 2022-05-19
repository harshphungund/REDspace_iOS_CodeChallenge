//
//  CharactersDetailViewModel.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import UIKit

protocol CharactersDetailViewModellable{
    init(result: Result)
    func getImage() -> String
    func getName() -> String
    func getStatus() -> String
    func getGender() -> String
    func getSpecies() -> String
    func getLocation() -> String
}

class CharactersDetailViewModel: NSObject, CharactersDetailViewModellable {
    var result: Result?
    required init(result: Result){
        self.result = result
    }
    func getImage() -> String{
        return self.result?.image ?? ""
    }
    func getName() -> String{
        return self.result?.name ?? "No Name"
    }
    func getStatus() -> String{
        return self.result?.status.rawValue ?? Status.unknown.rawValue
    }
    func getGender() -> String{
        return self.result?.gender.rawValue ?? Gender.unknown.rawValue
    }
    func getSpecies() -> String{
        return self.result?.species ?? "Unknown"
    }
    func getLocation() -> String{
        return self.result?.location.name ?? "Unknown"
    }
}


