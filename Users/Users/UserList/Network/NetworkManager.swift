//
//  NetworkManager.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchUsers(completion: @escaping (Result<UserList, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                return
            }

            do {
                let users = try JSONDecoder().decode(UserList.self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

