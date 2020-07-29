//
//  CharacteristicsCollectionViewCell.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CharacteristicsCollectionViewCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
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
            mainCollectionView.register(CharacteristicsCell.self, forCellWithReuseIdentifier: "cellId")
            
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
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CharacteristicsCell
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: frame.width, height: frame.height)
        }
        
    }



class CharacteristicsCell: UICollectionViewCell {

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
        text_1.text = "Характеристики"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_1.font = text_1.font.withSize(17)
        let color_1 = #colorLiteral(red: 0.1215686275, green: 0.1764705882, blue: 0.2392156863, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)

        text_1.snp.makeConstraints { (make) in
            make.width.equalTo(135)
            make.top.equalTo(view.snp.top).offset(22)
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


        
        
        let text_2 = UILabel()
        text_2.text = "Модуль"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_2.font = text_2.font.withSize(14)
        let color_7 = #colorLiteral(red: 0.5176470588, green: 0.5725490196, blue: 0.6509803922, alpha: 1)
        text_2.textColor = color_7
        self.addSubview(text_2)

        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.top.equalTo(view.snp.top).offset(60)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        let text_3 = UILabel()
        text_3.text = "Модуль"
        text_3.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_3.font = text_3.font.withSize(14)
        text_3.textColor = color_7
        self.addSubview(text_3)

        text_3.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.top.equalTo(view.snp.top).offset(88)
            make.left.equalTo(view.snp.left).offset(16)
        }

        
        let text_4 = UILabel()
        text_4.text = "Модуль"
        text_4.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_4.font = text_4.font.withSize(14)
        text_4.textColor = color_7
        self.addSubview(text_4)

        text_4.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.top.equalTo(view.snp.top).offset(116)
            make.left.equalTo(view.snp.left).offset(16)
        }

        let text_5 = UILabel()
        text_5.text = "Модуль"
        text_5.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_5.font = text_5.font.withSize(14)
        text_5.textColor = color_7
        self.addSubview(text_5)

        text_5.snp.makeConstraints { (make) in
            make.width.equalTo(130)
            make.top.equalTo(view.snp.top).offset(144)
            make.left.equalTo(view.snp.left).offset(16)
        }
        
        let text_6 = UILabel()
        text_6.text = "Описание"
        text_6.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_6.font = text_6.font.withSize(14)
        let color_4 = #colorLiteral(red: 0.1215686275, green: 0.1764705882, blue: 0.2392156863, alpha: 1)
        text_6.textColor = color_4
        self.addSubview(text_6)

        text_6.snp.makeConstraints { (make) in
            make.width.equalTo(190)
            make.top.equalTo(view.snp.top).offset(60)
            make.left.equalTo(view.snp.left).offset(148)
        }
        
        let text_7 = UILabel()
        text_7.text = "Описание"
        text_7.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_7.font = text_7.font.withSize(14)
        text_7.textColor = color_4
        self.addSubview(text_7)

        text_7.snp.makeConstraints { (make) in
            make.width.equalTo(190)
            make.top.equalTo(view.snp.top).offset(88)
            make.left.equalTo(view.snp.left).offset(148)
        }

        
        let text_8 = UILabel()
        text_8.text = "Описание"
        text_8.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_8.font = text_6.font.withSize(14)
        text_8.textColor = color_4
        self.addSubview(text_8)

        text_8.snp.makeConstraints { (make) in
            make.width.equalTo(190)
            make.top.equalTo(view.snp.top).offset(116)
            make.left.equalTo(view.snp.left).offset(148)
        }

        
        let text_9 = UILabel()
        text_9.text = "Описание"
        text_9.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_9.font = text_6.font.withSize(14)
        text_9.textColor = color_4
        self.addSubview(text_9)

        text_9.snp.makeConstraints { (make) in
            make.width.equalTo(190)
            make.top.equalTo(view.snp.top).offset(144)
            make.left.equalTo(view.snp.left).offset(148)
        }

        
        
        

        




        


        
    }
    
    
}

