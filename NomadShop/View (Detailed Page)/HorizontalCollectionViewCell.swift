//
//  HorizontalCollectionViewCell.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HorizontalCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
        var banner = Banner?.self

        
        fileprivate let data = [
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "koleso")),
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "koleso")),
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
            mainCollectionView.register(DetailPageBannerCell.self, forCellWithReuseIdentifier: "cellId")
            
            mainCollectionView.snp.makeConstraints { (make) in
                make.left.equalTo(1)
                make.right.equalTo(10)
                make.top.equalTo(10)
                make.bottom.equalTo(20)
    
            }

//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DetailPageBannerCell
            collectionCell.data = self.data[indexPath.item]
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: frame.width - 45, height: frame.height - 8)
        }
        
    }



class DetailPageBannerCell: UICollectionViewCell {
    
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
        view.backgroundColor = .white

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.width.equalTo(369)
            make.height.equalTo(192)

        }
        
        addSubview(bannerImage)
        bannerImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)

        
        bannerImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(16.36)
            make.left.equalTo(view.snp.left).offset(107.75)

            make.width.equalTo(114.49)
            make.height.equalTo(145)

        }

        



    }
    
    let bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "banner1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}


