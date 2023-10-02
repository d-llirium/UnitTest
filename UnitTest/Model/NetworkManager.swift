//
//  NetworkManager.swift
//  UnitTest
//
//  Created by User on 29/09/23.
//

import Foundation

enum NetworkError: Error { // Enums for defining error types
    case invalidURL
    case invalidResponse
    case requestFailed(statusCode: Int)
}

// MARK: - Network Class first handling Network Requests using URLSessions.  to Make API calls
class NetworkManager {
    // MARK: - PROPERTIES
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.example.com"
    
    // MARK: - FUNCTIONS
    public init() {}
    
    func fetchData(completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(statusCode: -1)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.requestFailed(statusCode: httpResponse.statusCode)))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
