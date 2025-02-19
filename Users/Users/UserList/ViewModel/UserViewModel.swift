//
//  UserViewModel.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import Foundation

protocol UserListViewModelDelegate: AnyObject {
    func userListFetched(isSuccess: Bool, error: Error?)
}

class UserListViewModel {
    weak var delegate: UserListViewModelDelegate?
    private let userRepository = UserListRepository()
    var users: UserList = []

    func fetchUsers() {
        userRepository.getUsers { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let users):
                self.users = users
                self.delegate?.userListFetched(isSuccess: true, error: nil)
            case .failure(let error):
                self.delegate?.userListFetched(isSuccess: false, error: error)
            }
        }
    }
}
