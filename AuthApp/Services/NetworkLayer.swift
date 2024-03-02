//
//  NetworkLayer.swift
//  AuthApp
//
//  Created by Камаль Атавалиев on 02.03.2024.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "example.com"
    static let path = "/api"
    
    static func userURL(with endpoint: String, parameters: [String: String]? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.path + endpoint
        
        if let parameters = parameters {
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        return components.url
    }
}

// Определение ошибок, которые могут возникнуть при сетевом запросе
enum NetworkError: Error {
    case invalidURL
    case encodingError
    case badResponse
    case dataNotFound
    case serverError(String)
}

class NetworkLayer {
    static let shared = NetworkLayer() // Singleton instance
    
    private let baseURL = "https://example.com/api"
    
    private init() {}
    
    func createUser(_ user: User, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let jsonData = try? JSONEncoder().encode(user) else {
            completion(.failure(.encodingError))
            return
        }
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.serverError(error.localizedDescription)))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.badResponse))
                    return
                }
                
                guard data != nil else {
                    completion(.failure(.dataNotFound))
                    return
                }
                
                completion(.success(()))
            }
        }
        task.resume()
    }
}
