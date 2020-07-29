//
//  ReviewCollectionViewCell.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ReviewCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
        var banner = Banner?.self
        
        
        
        fileprivate let data = [
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "PlusVector")),
        ]


        override init(frame: CGRect) {
            super.init(frame: frame)
            setupViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        let mainCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            collectionView.backgroundColor = .clear
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
        }()
        
        func setupViews(){
    //        addSubview(thumbnailImageView)
    //        addSubview(separatorView)
    //        addSubview(userProfileImageView)
            addSubview(mainCollectionView)
            mainCollectionView.dataSource = self
            mainCollectionView.delegate = self
            mainCollectionView.backgroundColor = .clear
            mainCollectionView.register(ReviewCell.self, forCellWithReuseIdentifier: "cellId")
            
            mainCollectionView.snp.makeConstraints { (make) in
                make.left.equalTo(1)
                make.right.equalTo(1)
                make.top.equalTo(20)
                make.bottom.equalTo(20)
    
            }

//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ReviewCell
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: frame.width, height: frame.height)
        }
        
    }



class ReviewCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
            
        let view = UIView()
        view.backgroundColor = .white

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(414)
            make.height.equalTo(165)

        }
        
        
        let text_1 = UILabel()
        text_1.text = "Отзывы"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_1.font = text_1.font.withSize(17)
        let color_1 = #colorLiteral(red: 0.137254902, green: 0.1568627451, blue: 0.168627451, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)

        text_1.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.equalTo(view.snp.top).offset(16)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        let button = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "Arrow-1") {
            button.setImage(image, for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(25.5)
            make.left.equalTo(view.snp.left).offset(338.08)
            make.width.equalTo(8)
            make.height.equalTo(13)
            
        }


        
        
    }
    
    
}

