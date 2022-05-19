//
//  APIResponseHandler.swift
//  REDspace_iOS_CodeChallenge
//
//  Created by Harsh on 19/05/22.
//

import Foundation

struct APIServiceError: Error, Codable {
    let httpStatus: Int
    let message: String
    let description: String?
}

struct UnknownError: Error { }


protocol APIResponseHandler {
    associatedtype APIResponseDataType
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> APIResponseDataType
}

protocol APIResponse: Codable {
    var httpStatus: Int { set get }
}

extension APIResponseHandler {
    /// generic response data parser
    func defaultParseResponse<T: Decodable>(data: Data, response: HTTPURLResponse) throws -> T {

        let jsonDecoder = JSONDecoder()

        if let body = try? jsonDecoder.decode(T.self, from: data), response.statusCode == 200 {
            return body
        } else if let errorResponse = try? jsonDecoder.decode(APIServiceError.self, from: data) {
            throw errorResponse
        } else {
            throw UnknownError()
        }
    }
}
