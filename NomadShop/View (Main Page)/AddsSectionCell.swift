//
//  LastSectionCells.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/16/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AddsSectionCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
        var banner = Banner?.self

        
        fileprivate let data = [
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "wheel")),
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "wheel")),
            CustomData(title: "Banner !!!", backgroundImage: #imageLiteral(resourceName: "wheel")),
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
            addSubview(mainCollectionView)
            
            mainCollectionView.dataSource = self
            mainCollectionView.delegate = self
            
            mainCollectionView.register(AdsCell.self, forCellWithReuseIdentifier: "cellId")
            
            mainCollectionView.snp.makeConstraints { (make) in
                make.left.equalTo(16)
                make.right.equalTo(16)
                make.top.equalTo(16)
                make.bottom.equalTo(16)
            }
            

//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
//            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-10-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AdsCell
            collectionCell.data = self.data[indexPath.item]
            return collectionCell
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: 170, height: frame.height)
        }
        
    }


class AdsCell: UICollectionViewCell {
    
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
        backgroundColor = .white
        addSubview(bannerImage)
        
        let view = UIView()

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(frame.height)
            make.width.equalTo(frame.width)

        }
        bannerImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        bannerImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(31)
            make.left.equalTo(view.snp.left).offset(39)
//            make.right.equalTo(39)
            make.width.equalTo(82)
            make.height.equalTo(82)
        }
        let text_1 = UILabel()
        text_1.text = "706150 Комплект болтов головки цилидра"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_1.font = text_1.font.withSize(11)
        let color_1 = #colorLiteral(red: 0.5176470588, green: 0.5725490196, blue: 0.6509803922, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)
        text_1.lineBreakMode = .byWordWrapping
        text_1.numberOfLines = 0

        text_1.snp.makeConstraints { (make) in
            make.width.equalTo(140)
            make.top.equalTo(bannerImage.snp.bottom).offset(17)
            make.left.equalTo(15)
        }
        
        let text_2 = UILabel()
        text_2.text = "60 000 ₸"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_2.font = text_2.font.withSize(11)
        let color_2 = #colorLiteral(red: 0.1215686275, green: 0.1764705882, blue: 0.2392156863, alpha: 1)
        text_2.textColor = color_2
        self.addSubview(text_2)

        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.top.equalTo(text_1.snp.bottom).offset(14)
            make.left.equalTo(15)
        }
        
        let view_3 = UIView()
        let color = #colorLiteral(red: 1, green: 0.8392156863, blue: 0, alpha: 1)
        view_3.backgroundColor = color
        view_3.layer.cornerRadius = 5


        self.addSubview(view_3)
        view_3.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalTo(53)
            make.top.equalTo(text_1.snp.bottom).offset(11)
            make.left.equalTo(text_2.snp.left).offset(63)
        }
        let text_3 = UILabel()
        text_3.text = "70 345 ₸"
        text_3.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_3.font = text_3.font.withSize(11)
        text_3.textColor = color_2
        self.addSubview(text_3)

        text_3.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.top.equalTo(text_1.snp.bottom).offset(14)
            make.left.equalTo(text_2.snp.left).offset(66)
        }
        let text_4 = UILabel()
        let color_3 = #colorLiteral(red: 0.4941176471, green: 0.5529411765, blue: 0.6235294118, alpha: 1)
        text_4.text = "x 24 мес"
        text_4.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_4.font = text_3.font.withSize(8)
        text_4.textColor = color_3
        self.addSubview(text_4)
        text_4.lineBreakMode = .byWordWrapping
        text_4.numberOfLines = 0


        text_4.snp.makeConstraints { (make) in
            make.width.equalTo(30)
            make.top.equalTo(text_1.snp.bottom).offset(12)
            make.left.equalTo(text_2.snp.left).offset(126)
        }
        
        let btn = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "FavouriteIcon") {
            btn.setImage(image, for: .normal)
        }
        btn.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.right.equalTo(-16)
            make.width.equalTo(18)
            make.height.equalTo(16)
        }
        
        let view_5 = UIView()
        let color_5 = #colorLiteral(red: 0.7607843137, green: 0.2705882353, blue: 0.2431372549, alpha: 1)
        view_5.backgroundColor = color_5
        view_5.layer.cornerRadius = 10


        self.addSubview(view_5)
        view_5.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(26)
            make.top.equalTo(view.snp.top).offset(12)
            make.left.equalTo(view.snp.left).offset(12)
        }

        let text_5 = UILabel()
        text_5.text = "- 45%"
        text_5.font = UIFont(name: "SanFranciscoDisplay-Black", size: 10)
        text_5.font = text_5.font.withSize(13)
        text_5.textColor = .white
        self.addSubview(text_5)

        text_5.snp.makeConstraints { (make) in
            make.top.equalTo(view_5.snp.top).offset(5)
            make.left.equalTo(view_5.snp.left).offset(11)
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


