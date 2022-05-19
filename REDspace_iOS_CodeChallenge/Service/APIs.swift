//
//  RickMortyAPIs.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 18/05/22.
//

import UIKit

struct CharactersAPI: APIHandler {
    
    func makeRequest(from parameters: [String: Any]) -> APIRequest {
       
        let api = APIs(apiType: APIType.fetchCharacters)
        
        var urlComponents = URLComponents(string: api.apiBaseURL()+api.apiEndPointPath())!
        var queryItems = [URLQueryItem]()
        for (key, value) in parameters {
            queryItems.append(URLQueryItem(name: key, value: "\(value)"))
        }
        urlComponents.queryItems = queryItems
        let url = urlComponents.url
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        let request = APIRequest(urlRequest: urlRequest, requestBuilder: BaseRequest())
        
        return request
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> Characters {
        return try defaultParseResponse(data: data, response: response)
    }
}
