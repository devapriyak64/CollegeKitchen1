//
//  RecipeCollectionViewCell.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/5/20.
//

import UIKit
import SnapKit

class RecipeCollectionViewCell: UICollectionViewCell {
    
    var postLabel: UILabel!
    var ratingLabel: UILabel!
    
    //var tagsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .lightGray
        
        postLabel = UILabel()
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        postLabel.font =  UIFont(name: "HelveticaNeue-Medium", size: 20)
        contentView.addSubview(postLabel)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = ratingLabel.font.withSize(15)
        contentView.addSubview(ratingLabel)
        
        setupConstraints()
    }
    func configure(post: Post) {
        //print("Configuring RecipeCollectionViewCell")
        postLabel.text = post.title
        ratingLabel.text = String (post.overallRating)
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
    
    func setupConstraints() {
        
        postLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-50)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(postLabel.snp.top)
            make.leading.equalTo(postLabel.snp.trailing)
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
