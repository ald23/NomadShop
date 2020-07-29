//
//  SecondSectionCells.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/15/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SecondSectionCells: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    

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
        
        mainCollectionView.register(SecondCell.self, forCellWithReuseIdentifier: "cellId")
        
        mainCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(-16)
            make.right.equalTo(0)
            make.top.equalTo(16)
            make.bottom.equalTo(16)

        }

//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))
//        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": mainCollectionView]))


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

class SecondCell: UICollectionViewCell {
    
//    var data: CustomData? {
//        didSet {
//            guard let data = data else { return }
//            button_1.image = data.backgroundImage
//
//        }
//    }
//
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews(){
        
        let btn_1 = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "CarVector") {
            btn_1.setImage(image, for: .normal)
        }
        btn_1.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(btn_1)
        btn_1.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(19)
            make.width.equalTo(18)
            make.height.equalTo(14)
        }


        let btn_2 = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "PlusVector") {
            btn_2.setImage(image, for: .normal)
        }
        btn_2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn_2.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.addSubview(btn_2)
        btn_2.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-20)
            make.width.equalTo(14)
            make.height.equalTo(14)
        }
        
        let text_1 = UILabel()
        text_1.text = "Поиск по деталям"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
        text_1.font = text_1.font.withSize(17)
        let color_1 = #colorLiteral(red: 0.1843137255, green: 0.5098039216, blue: 0.8235294118, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)

        text_1.snp.makeConstraints { (make) in
            make.left.equalTo(56)
        }
        
        let text_2 = UILabel()
        text_2.text = "Выберите авто из гаража для удобного поиска"
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
            make.left.equalTo(56)
        }
        
        let view = UIView()
        let color_3 = #colorLiteral(red: 0.8980392157, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        view.backgroundColor = color_3
        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.top.equalTo(text_2.snp.top).offset(46)
            make.width.equalTo(frame.width)
            make.height.equalTo(1)
        }

        
    }
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }

    
    
}


