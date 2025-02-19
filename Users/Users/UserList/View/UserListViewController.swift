//
//  UserListViewController.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import UIKit

class UserListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let viewModel = UserListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureActivityIndicator()
        setViewModel()
        fetchUsers()
    }

    private func configureActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.color = .blue
        activityIndicator.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        self.view.addSubview(activityIndicator)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UserListTableViewCell",
                                 bundle: .main),
                           forCellReuseIdentifier: "UserListTableViewCell")
    }
    private func setViewModel() {
        viewModel.delegate = self
    }
    private func fetchUsers() {
        activityIndicator.startAnimating()
        viewModel.fetchUsers()
    }
    
    func showErrorAlert(title:String, error: String) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as? UserListTableViewCell else { return UITableViewCell()}
        cell.delegate = self
        let user = viewModel.users[indexPath.row]
        cell.configureCell(id: user.id,
                           fullName: user.name,
                           mail: user.email)
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension UserListViewController: UserListTableViewCellDelegate {
    func toDetailButtonTapped(id: Int) {
        let selectedUser = viewModel.users.filter { user in
            user.id == id
        }
        guard selectedUser.first != nil else {
            showErrorAlert(title: "Warning", error: "Selected User Filtering Error")
            return
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyBoard.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController {
            detailVC.user = selectedUser.first
            detailVC.modalPresentationStyle = .pageSheet
            self.present(detailVC, animated: true)
        }
    }
}


extension UserListViewController: UserListViewModelDelegate {
    func userListFetched(isSuccess: Bool, error: (any Error)?) {
        activityIndicator.stopAnimating()
        if isSuccess && error == nil {
            self.tableView.reloadData()
        } else {
            self.showErrorAlert(title: "Opps!",
                                error: error?.localizedDescription ?? "Unknown Error")
        }
    }
}
