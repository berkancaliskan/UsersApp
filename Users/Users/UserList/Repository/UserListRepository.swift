//
//  UserListRepository.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import Foundation

class UserListRepository {
    func getUsers(completion: @escaping (Result<UserList, Error>) -> Void) {
        NetworkManager.shared.fetchUsers { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
