//
//  CharactersDetailViewModelTests.swift
//  REDspace_iOS_CodeChallengeTests
//
//  Created by Harsh on 19/05/22.
//

import XCTest

@testable import REDspace_iOS_CodeChallenge

class CharactersDetailViewModelTests: XCTestCase {

    let mockResult = Result(id: 0, name: "MockUser", species: "Mock", type: "Mock", image: "MockImage", url: "www.google.com", created: "DummyTimeStamp", status: Status(rawValue: "unknown")!, gender: Gender(rawValue: "unknown")!, origin: Location(name: "DummyName", url: "DummyUrl"), location: Location(name: "DummyName", url: "DummyUrl"), episode: ["https://rickandmortyapi.com/api/episode/1"])

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_initialization_of_viewmodel_with_passed_parameter(){
        let result = mockResult
        let charactersDetailViewModel = CharactersDetailViewModel(result: result)

        XCTAssertNotNil(charactersDetailViewModel, "The result view model should not be nil.")
        XCTAssertTrue(charactersDetailViewModel.result?.name == mockResult.name, "The result property should be equal to the charactersService that was passed in.")
    }
    
    func test_getter_functions(){
        let result = mockResult
        let charactersDetailViewModel = CharactersDetailViewModel(result: result)
        XCTAssertTrue(charactersDetailViewModel.getImage() == mockResult.image, "The image property should be equal to the image that was passed in.")
        XCTAssertTrue(charactersDetailViewModel.getName() == mockResult.name, "The name property should be equal to the name that was passed in.")
        XCTAssertTrue(charactersDetailViewModel.getSpecies() == mockResult.species, "The species property should be equal to the species that was passed in.")
        XCTAssertTrue(charactersDetailViewModel.getGender() == mockResult.gender.rawValue, "The gender property should be equal to the gender that was passed in.")
        XCTAssertTrue(charactersDetailViewModel.getStatus() == mockResult.status.rawValue, "The status property should be equal to the status that was passed in.")
        XCTAssertTrue(charactersDetailViewModel.getLocation() == mockResult.location.name, "The location property should be equal to the location that was passed in.")

    }
}
