//
//  UserDetailViewController.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var nameFirstLettersBackView: UIView!
    @IBOutlet weak var nameFirstLettersLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    var user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        guard let user = user else { return }
        nameFirstLettersLabel.text = user.name?.getFirstLetters()
        userInfoLabel.font = .systemFont(ofSize: 20, weight: .light)
        userInfoLabel.text = "Name: \(user.name ?? "--")\n" +
                             "Username: \(user.username ?? "")\n" +
                             "Email: \(user.email ?? "--")\n\n" +
                             "Website: \(user.website ?? "")\n\n" +
                             "Street: \(user.address?.street ?? "")\n" +
                             "Zipcode: \(user.address?.zipcode ?? "")\n" +
                             "Suite: \(user.address?.suite ?? "")\n" +
                             "City: \(user.address?.city ?? "")\n\n" +
                             "Company Name: \(user.company?.name ?? "")\n" +
                             "Company Catch Phrase: \(user.company?.catchPhrase ?? "")\n" +
                             "Company BS: \(user.company?.bs ?? "")"
        
        
        nameFirstLettersBackView.backgroundColor = UIColor.contrastings.0
        nameFirstLettersLabel.textColor = UIColor.contrastings.1
        nameFirstLettersLabel.font = .boldSystemFont(ofSize: 24)
        nameFirstLettersBackView.layer.cornerRadius = 60
        nameFirstLettersBackView.layer.masksToBounds = true
    }
}
