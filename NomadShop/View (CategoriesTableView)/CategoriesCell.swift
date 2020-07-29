////
////  ProductCell.swift
////  NomadShop
////
////  Created by Aldiyar Massimkhanov on 7/18/20.
////  Copyright © 2020 Aldiyaar. All rights reserved.
////
//
import Foundation
import UIKit

class CategoriesCell : UITableViewCell {
    
    var ArrowImageView = UIImageView()
    var CategoryTitleLabel = UILabel()
//    var CellView = UIView()
    
//    lazy var backView: UIView = {
//        let view = UIView(frame: CGRect(x: 20, y: 6, width: self.frame.width, height: 64))
//        view.backgroundColor = .red
//        print(self.frame.width)
//
//        return view
//    }()
//
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addSubview(backView)
        addSubview(ArrowImageView)
        addSubview(CategoryTitleLabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
        
        backgroundColor = .clear // very important
        layer.masksToBounds = false
//        layer.shadowOpacity = 0.23
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 0, height: 0)
        let color = #colorLiteral(red: 0.9764705882, green: 0.9803921569, blue: 0.9882352941, alpha: 1)
        layer.shadowColor = UIColor(red: 157.0/255.0, green: 157.0/255.0, blue: 157.0/255.0, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)

        // add corner radius on `contentView`
        contentView.backgroundColor = color
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.white.cgColor
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(category: Category) {
        
        CategoryTitleLabel.text = category.title
        ArrowImageView.image = category.image
    }
    
    func configureImageView() {
        ArrowImageView.layer.cornerRadius = 10
        ArrowImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        CategoryTitleLabel.numberOfLines = 0
        CategoryTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    
    func setTitleLabelConstraints() {
        CategoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
//        CategoryTitleLabel.snp.makeConstraints { (make) in
//            make.leading.equalTo(backView.snp.leading).offset(16)
//            make.height.equalTo(20)
//
//        }
        CategoryTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        CategoryTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        ArrowImageView.widthAnchor.constraint(equalTo: ArrowImageView.heightAnchor, multiplier: 16/9).isActive = true
        CategoryTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//
    }

    func setImageConstraints() {
        ArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        ArrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        ArrowImageView.leadingAnchor.constraint(equalTo: CategoryTitleLabel.trailingAnchor, constant: 20).isActive = true
        ArrowImageView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        ArrowImageView.heightAnchor.constraint(equalToConstant: 13).isActive = true
        ArrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50.1).isActive = true
//        ArrowImageView.snp.makeConstraints { (make) in
//            make.leading.equalTo(CategoryTitleLabel.snp.trailing).offset(20)
//            make.height.equalTo(13)
//            make.trailing.equalTo(-51)
//            make.width.equalTo(8)
//        }

    }

    
}
