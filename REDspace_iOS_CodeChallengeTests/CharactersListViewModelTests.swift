//
//  CharactersListViewModelTests.swift
//  REDspace_iOS_CodeChallengeTests
//
//  Created by Harsh on 19/05/22.
//

import XCTest
@testable import REDspace_iOS_CodeChallenge

let mockSuccessResults = [Result(id: 0, name: "MockUser", species: "Mock", type: "Mock", image: "MockImage", url: "www.google.com", created: "DummyTimeStamp", status: Status(rawValue: "unknown")!, gender: Gender(rawValue: "unknown")!, origin: Location(name: "DummyName", url: "DummyUrl"), location: Location(name: "DummyName", url: "DummyUrl"), episode: ["https://rickandmortyapi.com/api/episode/1"])]
let mockFailureResults:[Result]? = nil

fileprivate class MockCharactersService : CharactersServicable {
    var isSuccess:Bool = true
    
    func fetchCharacters(parameters: [String : Any], completion: @escaping ([Result]?) -> ()) {
        if isSuccess{
            completion(mockSuccessResults)
        }
        
        else{
            completion(mockFailureResults)
        }
    }
}

class CharactersListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_default_initialization_of_viewmodel(){
       //Default parameter initialization
        let charactersListViewModelWithDefaultParameter = CharactersListViewModel()
        XCTAssertNotNil(charactersListViewModelWithDefaultParameter, "The characterslist view model should not be nil.")
    }

    func test_initialization_of_viewmodel_with_passed_parameter(){
        let charactersServiceParam = CharactersService() as CharactersServicable?
        let charactersListViewModelWithParameter = CharactersListViewModel(charactersServiceParam: charactersServiceParam)

        XCTAssertNotNil(charactersListViewModelWithParameter, "The characterslist view model should not be nil.")
        XCTAssertTrue(charactersListViewModelWithParameter.charactersService === charactersServiceParam, "The charactersService property should be equal to the charactersService that was passed in.")
    }
    
    func test_fetch_characters_success(){
        let charactersSerVice = MockCharactersService()
        charactersSerVice.isSuccess  = true
        let charactersListViewModel = CharactersListViewModel(charactersServiceParam: charactersSerVice)
        charactersListViewModel.loadCharacters {
            XCTAssertFalse(charactersListViewModel.charactersList.count == 0)
        }
    }
    
    func test_numberOfItems_success(){
        let charactersSerVice = MockCharactersService()
        charactersSerVice.isSuccess  = true
        let charactersListViewModel = CharactersListViewModel(charactersServiceParam: charactersSerVice)
        charactersListViewModel.loadCharacters {
            let numberOfItems = charactersListViewModel.numberOfItemsInSection(section: 0, isSearchControllerActive: false)
            XCTAssertTrue(numberOfItems == mockSuccessResults.count)
        }
    }
    
    func test_itemAtIndex_success(){
        let charactersSerVice = MockCharactersService()
        charactersSerVice.isSuccess  = true
        let charactersListViewModel = CharactersListViewModel(charactersServiceParam: charactersSerVice)
        charactersListViewModel.loadCharacters {
            let item = charactersListViewModel.itemAtIndexPath(indexPath: IndexPath(row: 0, section: 0), isSearchControllerActive: false)
            XCTAssertTrue(item.name == mockSuccessResults[0].name)
        }
    }
    
    
    func test_fetch_characters_failure(){
        let charactersSerVice = MockCharactersService()
        charactersSerVice.isSuccess  = false
        let charactersListViewModel = CharactersListViewModel(charactersServiceParam: charactersSerVice)
        charactersListViewModel.loadCharacters {
            XCTAssertTrue(charactersListViewModel.charactersList.count == 0)
        }
    }
    
    func test_numberOfItems_failure(){
        let charactersSerVice = MockCharactersService()
        charactersSerVice.isSuccess  = false
        let charactersListViewModel = CharactersListViewModel(charactersServiceParam: charactersSerVice)
        charactersListViewModel.loadCharacters {
            let numberOfItems = charactersListViewModel.numberOfItemsInSection(section: 0, isSearchControllerActive: false)
            XCTAssertTrue(numberOfItems == 0)
        }
    }
}
