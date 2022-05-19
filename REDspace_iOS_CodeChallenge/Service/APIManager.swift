//
//  APIManager.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 18/05/22.
//

import Foundation

typealias APIHandler = APIRequestHandler & APIResponseHandler

class APIRequestLoader<T: APIHandler> {
    let apiRequest: T
    let urlSession: URLSession
    
    init(apiRequest: T, urlSession: URLSession = .shared) {
        self.apiRequest = apiRequest
        self.urlSession = urlSession
    }
    
    func loadAPIRequest(apiRequestData: T.APIRequestDataType,
                        completionHandler: @escaping (T.APIResponseDataType?, Error?) -> ()) {
        let urlRequest = apiRequest.makeRequest(from: apiRequestData).urlRequest
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let responseData = data else { return completionHandler(nil, error) }
            do {
                let parsedResponse = try self.apiRequest.parseResponse(data: responseData, response: response as! HTTPURLResponse)
                return completionHandler(parsedResponse, nil)
            } catch {
                return completionHandler(nil, error)
            }
        }.resume()
    }
}
