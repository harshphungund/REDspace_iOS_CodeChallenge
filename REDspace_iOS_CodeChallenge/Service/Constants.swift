//
//  Constants.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 18/05/22.
//

struct ServicesConstants {
    static let baseURL = "https://rickandmortyapi.com/api"
    static let characters = "/character"
}

struct AppConstants{
    static  let kCharacters = "Characters"
}

public enum MethodType: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
}

struct CharactersAPIQueryParameters {
    var pageNumber: Int? = 0
}

enum APIType {
      case fetchCharacters
      case fetchCharactersFor(CharactersAPIQueryParameters)
  }

struct APIs {
    
    var  apiType: APIType
    
    func httpMthodType() -> MethodType {
        var methodType = MethodType.get
        switch apiType{
        default :
            methodType = .get
        }
        return methodType
    }

    func apiEndPointPath() -> String {
        var path = ""
        switch apiType {
        case .fetchCharacters:
            path += ServicesConstants.characters
        case .fetchCharactersFor(let parameter):
            path += ServicesConstants.characters + "/\(parameter.pageNumber!)"
        }
        return path
    }

    func apiBaseURL() -> String {
        switch apiType {
        case .fetchCharacters:
            return ServicesConstants.baseURL
        case .fetchCharactersFor( _):
            return ServicesConstants.baseURL
        }
    }

}



