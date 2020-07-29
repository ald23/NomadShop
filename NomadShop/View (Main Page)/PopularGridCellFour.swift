//
//  PopularGreedCellFour.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/16/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PopularGridCellFour: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    fileprivate let data = [
        CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "grid3")),
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
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    func setupViews(){
        backgroundColor = .clear
        addSubview(mainCollectionView)
            
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        
        mainCollectionView.register(PopularCellFour.self, forCellWithReuseIdentifier: "cellId")

        
//        mainCollectionView.snp.makeConstraints { (make) in
//            make.left.equalTo(5)
//            make.right.equalTo(5)
//            make.top.equalTo(5)
//            make.bottom.equalTo(5)
//
//        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width-80, height: frame.height-40)
    }
    
}

class PopularCellFour: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bannerImage.image = data.backgroundImage
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
        let view = UIView()
        let color = #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        view.backgroundColor = color

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(150)
            make.width.equalTo(190)
            make.right.equalTo(50)

        }
        
        backgroundColor = .clear
        addSubview(bannerImage)
        bannerImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        bannerImage.snp.makeConstraints {(make) in
            make.left.equalTo(view.snp.left).offset(45)
            make.centerY.equalTo(view.snp.bottom).offset(-90)

            make.width.equalTo(85)
            make.height.equalTo(65)
        }
        
        let text = UILabel()
        text.text = "Шины, диски"
        text.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
        text.font = text.font.withSize(15)
        text.textColor = .black
        self.addSubview(text)

        text.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.left).offset(35)
            make.centerY.equalTo(bannerImage.snp.bottom).offset(20)

        }

        
    }

    let bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "grid4")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}

