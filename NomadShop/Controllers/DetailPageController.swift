//
//  DetailPageController.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/29/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DetailPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    
    var banners: [Banner] = {
        var ad = Banner()
        ad.title = "Yellow Ad"
        ad.thumbnailImageName = "Yellow_Ad"
        return [ad]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarItems()
//        setupAdsTitle()
        self.navigationItem.title = ""
//        setupAdsTitle()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = true


        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(DescriptionCollectionViewCell.self, forCellWithReuseIdentifier: "cellId1")
        collectionView.register(CharacteristicsCollectionViewCell.self, forCellWithReuseIdentifier: "cellId2")
        collectionView.register(PriceCollectionViewCell.self, forCellWithReuseIdentifier: "cellId3")
        collectionView.register((ReviewCollectionViewCell).self, forCellWithReuseIdentifier: "cellId4")
        collectionView.register(AddsSectionCell.self, forCellWithReuseIdentifier: "cellId5")


//        collectionView.register(ContactUsBanner.self, forCellWithReuseIdentifier: "cellId6")
//        collectionView.register(AddsSectionCell.self, forCellWithReuseIdentifier: "cellId8")
//        collectionView.register(AdsSectionTitle.self, forCellWithReuseIdentifier: "cellId7")
        
    }
    
    
    private func setupNavigationBarItems() {
        let literal = #colorLiteral(red: 0.1843137255, green: 0.5098039216, blue: 0.8235294118, alpha: 1)
        let navbar = UIView()
        self.view.addSubview(navbar)
        navbar.backgroundColor = .white
        navbar.snp.makeConstraints { (make) in
            make.height.equalTo(120)
            make.width.equalTo(self.view)
        }

        let button = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "FavouriteIcon") {
            button.setImage(image, for: .normal)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        button.frame = CGRect(x: 0, y: 0, width: 22, height: 21)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(22)
            make.height.equalTo(21)
            
        }

        
    }
    @objc func labelTapped() {
        

        let nextVC = CategoriesTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print("labelTapped tapped")

    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let color = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        collectionView.backgroundColor = color

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell
        }

        else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath)
            return cell
        }

        else if indexPath.item == 2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath)
            return cell
        }
        else if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId3", for: indexPath)
            return cell
        }
        else if indexPath.item == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId4", for: indexPath)
            return cell
        }
        else if indexPath.item == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId5", for: indexPath)
            return cell
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat

        if indexPath.item == 0 {
            width = view.frame.width
            height = 200
        }
        else if indexPath.item == 1 {
            width = view.frame.width
            height = 196
        }
        else if indexPath.item == 2{
            width = view.frame.width
            height = 200
        }
        else if indexPath.item == 3{
            width = view.frame.width
            height = 185
        }
        else if indexPath.item == 4{
            width = view.frame.width
            height = 300
        }
        else if indexPath.item == 5{
            width = view.frame.width
            height = 203
        }
        else{
            width = view.frame.width
            height = 200
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    


}

//
//class AdsSectionTitleForDetailPage_2: UICollectionViewCell {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = .clear
//        setupViews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    func setupViews(){
//        
//        let view = UIView()
//        let color = #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.968627451, alpha: 1)
//        view.backgroundColor = color
//
//        self.addSubview(view)
//        view.snp.makeConstraints { (make) in
//            make.height.equalTo(340)
//            make.width.equalTo(frame.width)
//            make.right.equalToSuperview()
//
//        }
//
//        
//        let text = UILabel()
//        text.text = "Другие товары продавца"
//        text.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
//        text.font = text.font.withSize(20)
//        text.textColor = .black
//        self.addSubview(text)
//
//        text.snp.makeConstraints { (make) in
//            make.top.equalTo(view.snp.top).offset(25)
//            make.left.equalTo(view.snp.left).offset(16)
//        }
//
//        
//
//        
//    }
//
//    
//}
//
