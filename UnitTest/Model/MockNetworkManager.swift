//
//  MockNetworkManager.swift
//  UnitTestTests
//
//  Created by User on 02/10/23.
//

import Foundation

class MockNetworkManager: NetworkManager {
    
    override func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        // Simulate a successful API response with status code 200
        let mockData = "Mock API Response".data(using: .utf8)
        completion(.success(mockData!))
    }
}
