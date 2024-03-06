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
    private let baseURL = "http://yourserver.com/api/v1/auth"
    
    static let shared = NetworkLayer()
    
    private init () {}

    func register(userCredentials: UserCredentials, completion: @escaping (Result<AuthenticationResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/register") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(userCredentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(NetworkError.encodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
                
            guard error == nil else {
                completion(.failure(NetworkError.serverError(error?.localizedDescription ?? "Server Error")))
                return
            }
            
            do {
                let authResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: data)
                completion(.success(authResponse))
            } catch {
                completion(.failure(NetworkError.badResponse))
            }
        }.resume()
    }
    //Доработать
    func authenticate(userCredentials: UserCredentials, completion: @escaping (Result<AuthenticationResponse, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/authenticate") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(userCredentials)
            request.httpBody = jsonData
        } catch {
            completion(.failure(NetworkError.encodingError))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(.failure(NetworkError.dataNotFound))
                return
            }
                
            guard error == nil else {
                completion(.failure(NetworkError.serverError(error?.localizedDescription ?? "Server Error")))
                return
            }
            
            do {
                let authResponse = try JSONDecoder().decode(AuthenticationResponse.self, from: data)
                completion(.success(authResponse))
            } catch {
                completion(.failure(NetworkError.badResponse))
            }
        }.resume()
    }
    
    func verify(token: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/verify?token=\(token)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            let message = String(data: data, encoding: .utf8) ?? "Verification failed"
            completion(.success(message))
        }.resume()
    }
}
