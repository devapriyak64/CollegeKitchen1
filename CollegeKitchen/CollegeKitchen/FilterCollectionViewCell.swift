//
//  FilterCollectionViewCell.swift
//  CollegeKitchen
//
//  Created by Vian Nguyen on 12/6/20.
//

import UIKit
import SnapKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var filterLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = UIColor(red: 242 / 255, green: 147 / 255, blue: 145 / 255, alpha: 1)
        contentView.backgroundColor = .white
        filterLabel = UILabel()
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        filterLabel.font = filterLabel.font.withSize(15)
        
        contentView.addSubview(filterLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        filterLabel.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(filter: Filter) {
        filterLabel.text = filter.name
        filterLabel.textAlignment = .center
        addShadow()
        if filter.didSelect == true {
            //contentView.backgroundColor = UIColor(red: 242 / 255, green: 147 / 255, blue: 145 / 255, alpha: 1)
            contentView.backgroundColor = .black
            filterLabel.textColor = .white
        } else {
            //contentView.backgroundColor = UIColor(red: 255 / 255, green: 210 / 255, blue: 209 / 255, alpha: 1)
            contentView.backgroundColor = .white
            filterLabel.textColor = .black
        }
        
    }
    func addShadow() {
          self.contentView.layer.cornerRadius = 15.0
          self.contentView.layer.borderWidth = 1.0
          self.contentView.layer.borderColor = UIColor.clear.cgColor
          self.contentView.layer.masksToBounds = true

          self.layer.shadowColor = UIColor.black.cgColor
          self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
          self.layer.shadowRadius = 2.0
          self.layer.shadowOpacity = 0.5
          self.layer.masksToBounds = false
          self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

