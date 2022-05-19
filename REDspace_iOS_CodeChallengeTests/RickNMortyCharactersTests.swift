//
//  RickNMortyCharactersTests.swift
//  REDspace_iOS_CodeChallengeTests
//
//  Created by Harsh on 19/05/22.
//

import XCTest

@testable import REDspace_iOS_CodeChallenge


class CharactersAPITests: XCTestCase  {

    let api = CharactersAPI()
    
    func test_api_for_request() {
        let params = [:] as [String : Any];
        let request = api.makeRequest(from: params)
        
        XCTAssertNotNil(request)
        XCTAssertNotNil(request.urlRequest.url)
        XCTAssertEqual(request.urlRequest.url?.scheme, "https")
    }
    

    
    func test_api_parsing_success() {
        let sampleResponse =
        """
        {
           "info":{
              "count":826,
              "pages":42,
              "next":"https://rickandmortyapi.com/api/character?page=2",
              "prev":null
           },
           "results":[
              {
                 "id":1,
                 "name":"Rick Sanchez",
                 "status":"Alive",
                 "species":"Human",
                 "type":"",
                 "gender":"Male",
                 "origin":{
                    "name":"Earth (C-137)",
                    "url":"https://rickandmortyapi.com/api/location/1"
                 },
                 "location":{
                    "name":"Citadel of Ricks",
                    "url":"https://rickandmortyapi.com/api/location/3"
                 },
                 "image":"https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                 "episode":[
                    "https://rickandmortyapi.com/api/episode/1",
                    "https://rickandmortyapi.com/api/episode/2",
                 ],
                 "url":"https://rickandmortyapi.com/api/character/1",
                 "created":"2017-11-04T18:48:46.250Z"
              }
           ]
        }
        """
        let jsonData = sampleResponse.data(using: .utf8)!
        
        XCTAssertNoThrow(try api.parseResponse(data: jsonData, response: HTTPURLResponse()))
    }
    
    func test_api_parsing_failure(){
            let sampleResponse =
            """
            {
            
            }
            """
            let jsonData = sampleResponse.data(using: .utf8)!
            XCTAssertThrowsError(try api.parseResponse(data: jsonData, response: HTTPURLResponse()))
    }
}


class RickNMortyCharactersTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
