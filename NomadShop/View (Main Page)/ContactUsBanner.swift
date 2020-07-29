//
//  ContactUsBanner.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/16/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ContactUsBanner: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

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
        
        mainCollectionView.register(ContactUsBannerCell.self, forCellWithReuseIdentifier: "cellId")
        

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return collectionCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 360, height: frame.height - 60)
    }
    
}

class ContactUsBannerCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        let view = UIView()
        let color = #colorLiteral(red: 1, green: 0.968627451, blue: 0.9294117647, alpha: 1)
        view.backgroundColor = color

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(91)
            make.width.equalTo(frame.width)
            make.right.equalToSuperview()

        }

        let button = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "Arrow") {
            button.setImage(image, for: .normal)
        }
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(38)
            make.right.equalTo(-27)
            make.width.equalTo(8)
            make.height.equalTo(13)
            
        }
        
        let text_1 = UILabel()
        text_1.text = "Не нашли нужный товар?"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
        text_1.font = text_1.font.withSize(17)
        let color_1 = #colorLiteral(red: 0.1843137255, green: 0.5098039216, blue: 0.8235294118, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)

        text_1.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(23)
            make.left.equalTo(23)
        }
        
        let text_2 = UILabel()
        text_2.text = "Свяжитесь с нами мы найдем"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_2.font = text_2.font.withSize(13)
        let color_2 = #colorLiteral(red: 0.5176470588, green: 0.5725490196, blue: 0.6509803922, alpha: 1)
        text_2.textColor = color_2
        self.addSubview(text_2)
        text_2.lineBreakMode = .byWordWrapping
        text_2.numberOfLines = 0

        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.top.equalTo(text_1.snp.top).offset(25)
            make.left.equalTo(text_1.snp.left)
        }
        

        
    }
    
    
}


