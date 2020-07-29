//
//  DescriptionView.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//


import Foundation
import UIKit
import SnapKit

class DescriptionCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
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
            mainCollectionView.register(DescriptionCell.self, forCellWithReuseIdentifier: "cellId")
            
            mainCollectionView.snp.makeConstraints { (make) in
                make.left.equalTo(1)
                make.right.equalTo(1)
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
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DescriptionCell
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: frame.width, height: frame.height)
        }
        
    }



class DescriptionCell: UICollectionViewCell {

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
            make.height.equalTo(196)

        }
        
        
        let text_1 = UILabel()
        text_1.text = "ХГрузовая шина Нижнекамскшина Епмп ИН-1323БМ 9.00 R20"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_1.font = text_1.font.withSize(17)
        let color_1 = #colorLiteral(red: 0.2352941176, green: 0.2823529412, blue: 0.3450980392, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)
        text_1.lineBreakMode = .byWordWrapping
        text_1.numberOfLines = 0

        text_1.snp.makeConstraints { (make) in
            make.width.equalTo(343)
            make.top.equalTo(view.snp.top).offset(16)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        let starIcon = UIImageView()
        starIcon.image = UIImage(named: "StarIcon")

        self.addSubview(starIcon)
        starIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(74.29)
            make.left.equalTo(view.snp.left).offset(16)

            make.width.equalTo(12)
            make.height.equalTo(11.44)
        }
        
        let text_6 = UILabel()
        text_6.text = "4.9"
        text_6.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_6.font = text_6.font.withSize(14)
        let color_6 = #colorLiteral(red: 0.2352941176, green: 0.2823529412, blue: 0.3450980392, alpha: 1)
        text_6.textColor = color_6
        self.addSubview(text_6)

        text_6.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(70.5)
            make.left.equalTo(view.snp.left).offset(36)
        }

        let text_7 = UILabel()
        text_7.text = "(39 отзывов)"
        text_7.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_7.font = text_7.font.withSize(14)
        let color_7 = #colorLiteral(red: 0.5176470588, green: 0.5725490196, blue: 0.6509803922, alpha: 1)
        text_7.textColor = color_7
        self.addSubview(text_7)

        text_7.snp.makeConstraints { (make) in
            make.width.equalTo(87)
            make.top.equalTo(view.snp.top).offset(71)
            make.left.equalTo(view.snp.left).offset(65)
        }
        
        let text_8 = UILabel()
        text_8.text = "Код товара: 38492839"
        text_8.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_8.font = text_8.font.withSize(14)
        text_8.textColor = color_1
        self.addSubview(text_8)

        text_8.snp.makeConstraints { (make) in
            make.width.equalTo(155)
            make.top.equalTo(view.snp.top).offset(71)
            make.left.equalTo(view.snp.left).offset(215)
        }
        
        
        let text_4 = UILabel()
        text_4.text = "Ширина, высота, диаметр"
        text_4.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_4.font = text_4.font.withSize(13)
        text_4.textColor = color_1
        self.addSubview(text_4)

        text_4.snp.makeConstraints { (make) in
            make.width.equalTo(160)
            make.top.equalTo(view.snp.top).offset(117)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
            
        let view_3 = UIView()
        let color_3 = #colorLiteral(red: 0.8980392157, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        view_3.backgroundColor = color_3
        view_3.layer.cornerRadius = 7


        self.addSubview(view_3)
        view_3.snp.makeConstraints { (make) in
            make.width.equalTo(116)
            make.height.equalTo(40)
            make.top.equalTo(view.snp.top).offset(140)
            make.left.equalTo(view.snp.left).offset(16)
        }

        let text_5 = UILabel()
        text_5.text = "185 / 55 / 55"
        text_5.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_5.font = text_5.font.withSize(16)
        text_5.textColor = color_6
        self.addSubview(text_5)

        text_5.snp.makeConstraints { (make) in
            make.width.equalTo(105)
            make.top.equalTo(view_3.snp.top).offset(9)
            make.left.equalTo(view_3.snp.left).offset(9)
        }
        
        let text_2 = UILabel()
        text_2.text = "Изменить опции"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_2.font = text_2.font.withSize(16)
        let color_2 = #colorLiteral(red: 0.1843137255, green: 0.5098039216, blue: 0.8235294118, alpha: 1)
        text_2.textColor = color_2
        self.addSubview(text_2)

        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(135)
            make.top.equalTo(view.snp.top).offset(148)
            make.left.equalTo(view.snp.left).offset(238)
        }

        




        


        
    }
    
    
}

