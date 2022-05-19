//
//  CharactersService.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 18/05/22.
//

import UIKit

protocol CharactersServicable: AnyObject{
    func fetchCharacters(parameters: [String: Any], completion: @escaping ([Result]?) -> ())
}
    
class CharactersService: NSObject,  CharactersServicable{
    func fetchCharacters(parameters: [String: Any], completion: @escaping ([Result]?) -> ()){
        let api = CharactersAPI()
        let apiRequestLoader = APIRequestLoader(apiRequest: api)
        apiRequestLoader.loadAPIRequest(apiRequestData: parameters) { (result, error) in
            if error == nil{
                completion(result?.results)
            }
            else
            {
                completion(nil)
            }
        }
    }
}
