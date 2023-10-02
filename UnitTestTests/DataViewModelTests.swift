//
//  DataViewModelTests.swift
//  UnitTestTests
//
//  Created by User on 29/09/23.
//

import XCTest

// MARK: - DataViewModel class to ensure that it properly handles API calls.
@testable import UnitTest // import the app
class DataViewModelTests: XCTestCase {
    // MARK: - PROPERTIES
    var viewModel: DataViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = DataViewModel(networkManager: MockNetworkManager())
    }
    
    func testFetchData() {
        let expectation = XCTestExpectation(description: "Data fetched successfully")
        viewModel.fetchData { result in
            switch result {
            case .success(let data):
                let responseString = String(data: data, encoding: .utf8)
                XCTAssertEqual(responseString, "Mock API Response")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API call failed with error: \(error)")
            }
        }
        wait(for: [expectation], timeout: 5.0)
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
