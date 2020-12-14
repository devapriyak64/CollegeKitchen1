//
//  FriendsCollectionViewCell.swift
//  CollegeKitchen
//
//  Created by Jaden O'Brien on 12/13/20.
//

import UIKit

class FriendsCollectionViewCell: UICollectionViewCell {
    
    var profilePic: UIImageView!
    var username: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor(red: 1.00, green: 0.47, blue: 0.47, alpha: 1.00)
        
        profilePic = UIImageView()
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.contentMode = .scaleAspectFill
        profilePic.clipsToBounds = true
        contentView.addSubview(profilePic)
        
        username = UILabel()
        username.textColor = .white
        username.translatesAutoresizingMaskIntoConstraints = false
        username.font = .systemFont(ofSize: 20, weight: .bold)
        contentView.addSubview(username)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profilePic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profilePic.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profilePic.heightAnchor.constraint(equalToConstant: 75),
            profilePic.widthAnchor.constraint(equalToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            username.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            username.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for follower: User) {
        profilePic.image = follower.user_pic
        username.text = "@"+follower.username
        addShadow()
    }
    
    func addShadow() {
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.9
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
