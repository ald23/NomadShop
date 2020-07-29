//
//  PriceCollectionViewCell.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PriceCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
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
            mainCollectionView.register(PriceCell.self, forCellWithReuseIdentifier: "cellId")
            
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
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PriceCell
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: frame.width, height: frame.height)
        }
        
    }



class PriceCell: UICollectionViewCell {

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
        text_1.text = "60 000 ₸"
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
        
        
        let text_2 = UILabel()
        text_2.text = "Продавец"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_2.font = text_2.font.withSize(17)
        let color_2 = #colorLiteral(red: 0.1215686275, green: 0.1764705882, blue: 0.2392156863, alpha: 1)
        text_2.textColor = color_2
        self.addSubview(text_2)
        
        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.top.equalTo(view.snp.top).offset(68)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        
        let button = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "Arrow-1") {
            button.setImage(image, for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(71.5)
            make.left.equalTo(view.snp.left).offset(338.08)
            make.width.equalTo(8)
            make.height.equalTo(13)
            
        }

        
        
        
        let text_3 = UILabel()
        text_3.text = "Formula Store"
        text_3.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_3.font = text_3.font.withSize(17)
        let color_3 = #colorLiteral(red: 0.2352941176, green: 0.2823529412, blue: 0.3450980392, alpha: 1)
        text_3.textColor = color_3
        self.addSubview(text_3)

        text_3.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.top.equalTo(view.snp.top).offset(106)
            make.left.equalTo(view.snp.left).offset(16)
        }

            
        let geolocationIcon = UIImageView()
        geolocationIcon.image = UIImage(named: "geolocation")

        self.addSubview(geolocationIcon)
        geolocationIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(134)
            make.left.equalTo(view.snp.left).offset(17)

            make.width.equalTo(10.5)
            make.height.equalTo(14)
        }


        let text_5 = UILabel()
        text_5.text = "Самовывоз"
        text_5.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_5.font = text_5.font.withSize(13)
        let color_5 = #colorLiteral(red: 0.4941176471, green: 0.5529411765, blue: 0.6235294118, alpha: 1)
        text_5.textColor = color_5
        self.addSubview(text_5)

        text_5.snp.makeConstraints { (make) in
            make.width.equalTo(95)
            make.top.equalTo(view.snp.top).offset(133)
            make.left.equalTo(view.snp.left).offset(32.5)
        }
        
        
        let deliveryIcon = UIImageView()
        deliveryIcon.image = UIImage(named: "delivery")

        self.addSubview(deliveryIcon)
        deliveryIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(135.38)
            make.left.equalTo(view.snp.left).offset(124.5)

            make.width.equalTo(16)
            make.height.equalTo(11.25)
        }


        let text_6 = UILabel()
        text_6.text = "Бесплатно"
        text_6.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_6.font = text_6.font.withSize(13)
        text_6.textColor = color_5
        self.addSubview(text_6)

        text_6.snp.makeConstraints { (make) in
            make.width.equalTo(105)
            make.top.equalTo(view.snp.top).offset(133)
            make.left.equalTo(view.snp.left).offset(145.5)
        }

        
    }
    
    
}

