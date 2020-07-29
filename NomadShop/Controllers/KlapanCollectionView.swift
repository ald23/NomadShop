//
//  KlapanCollectionView.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/23/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class KlapanCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    
//    private lazy var listLayout = BaseLayout(staticCellHeight: listLayoutStaticCellHeight, nextLayoutStaticCellHeight: gridLayoutStaticCellHeight, layoutState: .ListLayoutState)
//
//    private lazy var gridLayout = BaseLayout(staticCellHeight: gridLayoutStaticCellHeight, nextLayoutStaticCellHeight: listLayoutStaticCellHeight, layoutState: .GridLayoutState)
//
//    collectionView.collectionViewLayout = listLayout
//    private var layoutState: CollectionViewLayoutState = .ListLayoutState
//

    var banners: [Banner] = {
        var ad = Banner()
        ad.title = "Yellow Ad"
        ad.thumbnailImageName = "Yellow_Ad"
        return [ad]
    }()

    override func viewDidLoad() {

        self.navigationItem.title = "Клапан / регулировка"
        super.viewDidLoad()
//        setupAdsTitle()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = true

        let color = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        collectionView.backgroundColor = color
        collectionView.register(KlapanCells.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(KlapanCells_2.self, forCellWithReuseIdentifier: "cellId1")

        setupNavigationBarItems()
    }
    
    private func setupNavigationBarItems() {
        let literal = #colorLiteral(red: 0.1843137255, green: 0.5098039216, blue: 0.8235294118, alpha: 1)
        let navbar = UIView()
        self.view.addSubview(navbar)
        navbar.backgroundColor = .white
        navbar.snp.makeConstraints { (make) in
            make.height.equalTo(140)
            make.width.equalTo(self.view)
        }

        let button = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "FavouriteIcon") {
            button.setImage(image, for: .normal)
        }
        button.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(KlapanCollectionView.labelTapped))
        button.addGestureRecognizer(gestureRecognizer)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        button.frame = CGRect(x: 0, y: 0, width: 22, height: 21)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(22)
            make.height.equalTo(21)
            
        }
    }
    
    @objc func labelTapped() {
        

        let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(newController, animated: true)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = PopularCellTwo()// dequeue cell
//        cell.onTapGesture = { [weak self] in
//            let nextVC = CategoriesTableViewController()
//            self?.navigationController?.pushViewController(nextVC, animated: true)
//
//        }
//        return cell

        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId1", for: indexPath)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell
        }
//        else if indexPath.item == 2{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId2", for: indexPath)
//            return cell
//        }
//        else if indexPath.item == 3 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId3", for: indexPath)
//            return cell
//        }
//        else if indexPath.item == 4 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId4", for: indexPath)
//            return cell
//        }
//        else if indexPath.item == 5 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId5", for: indexPath)
//            return cell
//        }
//        else if indexPath.item == 6 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId6", for: indexPath)
//            return cell
//        }
//        else if indexPath.item == 7 {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId7", for: indexPath)
//            return cell
//        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        width = view.frame.width
        height = 132

//        if indexPath.item == 0 {
//            width = view.frame.width
//            height = 200
//        }
//        else if indexPath.item == 1 {
//            width = view.frame.width
//            height = 120
//        }
//        else if indexPath.item == 2{
//            width = view.frame.width/2 - 8
//            height = 210
//        }
//        else if indexPath.item == 3{
//            width = view.frame.width/2 - 8
//            height = 210
//        }
//        else if indexPath.item == 4{
//            width = view.frame.width/2 - 8
//            height = 210
//        }
//        else if indexPath.item == 5{
//            width = view.frame.width/2 - 8
//            height = 210
//        }
//        else if indexPath.item == 6 {
//            width = view.frame.width
//            height = 115
//        }
//        else if indexPath.item == 7 {
//            width = view.frame.width
//            height = 64
//        }
//
//        else{
//            width = view.frame.width
//            height = 203
//        }
        return CGSize(width: width, height: height)
    }
    


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
         let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
         self.navigationController?.pushViewController(newController, animated: true)
        }
        
        if indexPath.item == 1 {
         let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
         self.navigationController?.pushViewController(newController, animated: true)
        }

        if indexPath.item == 2 {
         let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
         self.navigationController?.pushViewController(newController, animated: true)
        }

        if indexPath.item == 3 {
         let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
         self.navigationController?.pushViewController(newController, animated: true)
        }
        
        else {
             let newController = DetailPageController(collectionViewLayout: UICollectionViewFlowLayout())
             self.navigationController?.pushViewController(newController, animated: true)

        }

    }
    
    
    
}

