//
//  APIRequestHandler.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import Foundation

protocol APIRequestHandler {
    
    associatedtype APIRequestDataType
    
    func makeRequest(from data: APIRequestDataType) -> APIRequest
}

protocol APIRequestBuilder {
    func setHeaders(request: inout URLRequest)
}

class BaseRequest: APIRequestBuilder {
    func setHeaders(request: inout URLRequest) {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}

class APIRequest {
    private var request: URLRequest
    init(urlRequest: URLRequest, requestBuilder: APIRequestBuilder) {
        self.request = urlRequest
        requestBuilder.setHeaders(request: &self.request)
    }
    var urlRequest: URLRequest {
        return request
    }
}

extension APIRequestHandler {
    func setRequestBody(_ requestParameters: [String: Any], urlRequest: inout URLRequest) {
        if requestParameters.count != 0 {
            if let jsonData = try? JSONSerialization.data(withJSONObject: requestParameters, options: []) {
                urlRequest.httpBody = jsonData
            }
        }
    }
}
