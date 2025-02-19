//
//  UserListTableViewCell.swift
//  Users
//
//  Created by Berkan Çalışkan on 19.02.2025.
//

import UIKit

protocol UserListTableViewCellDelegate: AnyObject {
    func toDetailButtonTapped(id: Int)
}

class UserListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameFirstLettersBackView: UIView!
    @IBOutlet weak var nameFirstLettersLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var toDetailButton: UIButton!
    weak var delegate: UserListTableViewCellDelegate?
    private var id: Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    private func setupCell() {
        self.selectionStyle = .none
        
        nameFirstLettersBackView.layer.cornerRadius = 35
        nameFirstLettersBackView.layer.masksToBounds = true
        nameFirstLettersLabel.font = .boldSystemFont(ofSize: 20)
        nameLabel.font = .boldSystemFont(ofSize: 18)
        mailLabel.font = .systemFont(ofSize: 18, weight: .light)
        
        toDetailButton.layer.cornerRadius = 14
        toDetailButton.layer.masksToBounds = true
        toDetailButton.backgroundColor = .systemGreen
        toDetailButton.setTitle("Show Detail", for: .normal)
        toDetailButton.setTitleColor(.white, for: .normal)
        toDetailButton.addTarget(self, action: #selector(toDetailButtonTapped), for: .touchUpInside)
    }
    
    @objc func toDetailButtonTapped() {
        if let id = self.id {
            delegate?.toDetailButtonTapped(id: id)
        } else {
            print("Unknow ID error!")
        }
    }
    
    func configureCell(id:Int?, fullName: String?, mail: String?) {
        self.id = id
        let randomColor = UIColor.contrastings
        nameFirstLettersBackView.backgroundColor = randomColor.0
        nameFirstLettersLabel.textColor = randomColor.1
        nameFirstLettersLabel.text = fullName?.getFirstLetters()
        nameLabel.text = fullName
        mailLabel.text = mail
    }
}
