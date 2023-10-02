//
//  DataViewModel.swift
//  UnitTest
//
//  Created by User on 29/09/23.
//

import Foundation

// MARK: - ViewModel class to manage data and API calls.
class DataViewModel {
    // MARK: - PROPERTIES
    private let networkManager: NetworkManager
    
    // MARK: - FUNCTIONS
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        networkManager.fetchData(completion: completion)
    }
}
