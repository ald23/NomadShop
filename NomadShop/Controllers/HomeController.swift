//
//  ViewController.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/15/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//
import Foundation
import UIKit
import SnapKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {

    
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
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = true

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        
        collectionView.backgroundColor = UIColor.white
        collectionView.register(MainCells.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(SecondSectionCells.self, forCellWithReuseIdentifier: "cellId1")
        collectionView.register(PopularGridCells.self, forCellWithReuseIdentifier: "cellId2")
        collectionView.register((PopularGridCellTwo).self, forCellWithReuseIdentifier: "cellId3")
        collectionView.register(PopularGridCellThree.self, forCellWithReuseIdentifier: "cellId4")
        collectionView.register(PopularGridCellFour.self, forCellWithReuseIdentifier: "cellId5")
        collectionView.register(ContactUsBanner.self, forCellWithReuseIdentifier: "cellId6")
        collectionView.register(AddsSectionCell.self, forCellWithReuseIdentifier: "cellId8")
        collectionView.register(AdsSectionTitle.self, forCellWithReuseIdentifier: "cellId7")
        
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
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize, weight: .bold)
        label.text = "Магазин"
        label.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)


        let label2 = UILabel()
        label2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
        label2.textColor = literal
        label2.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        label2.text = "Алматы"
        label2.isUserInteractionEnabled = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: label2)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeController.labelTapped))
        label2.addGestureRecognizer(gestureRecognizer)

        let searchBar = UISearchBar()
        searchBar.placeholder = "Поиск"
        searchBar.frame = CGRect(x: 0, y: 0, width: (navigationController?.view.bounds.size.width)!, height: 30)
        
        searchBar.barStyle = .default
        searchBar.barTintColor = UIColor.white
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.width.equalTo(410)
            make.height.equalTo(40)
            make.top.equalTo(90)
        }
        
    }
    @objc func labelTapped() {
        

        let nextVC = CategoriesTableViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        print("labelTapped tapped")

    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = PopularCellTwo()// dequeue cell
//        cell.onTapGesture = { [weak self] in
//            let nextVC = CategoriesTableViewController()
//            self?.navigationController?.pushViewController(nextVC, animated: true)
//           
//        }
//        return cell

        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
            return cell
        }
        else if  indexPath.item == 1{
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
        else if indexPath.item == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId6", for: indexPath)
            return cell
        }
        else if indexPath.item == 7 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId7", for: indexPath)
            return cell
        }


        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId8", for: indexPath)
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
            height = 120
        }
        else if indexPath.item == 2{
            width = view.frame.width/2 - 8
            height = 210
        }
        else if indexPath.item == 3{
            width = view.frame.width/2 - 8
            height = 210
        }
        else if indexPath.item == 4{
            width = view.frame.width/2 - 8
            height = 210
        }
        else if indexPath.item == 5{
            width = view.frame.width/2 - 8
            height = 210
        }
        else if indexPath.item == 6 {
            width = view.frame.width
            height = 115
        }
        else if indexPath.item == 7 {
            width = view.frame.width
            height = 64
        }

        else{
            width = view.frame.width
            height = 203
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//          print("row: \(indexPath.row)")
//       if indexPath.row == 3{
//
//           let nextVC = CategoriesTableViewController()
//           navigationController?.pushViewController(nextVC, animated: true)
//       }
//       else{
//         let nextVC = HomeController()
//         navigationController?.pushViewController(nextVC, animated: true)
//        }
//    }
//

}

class AdsSectionTitle: UICollectionViewCell {
    
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
        let color = #colorLiteral(red: 0.937254902, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        view.backgroundColor = color

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(340)
            make.width.equalTo(frame.width)
            make.right.equalToSuperview()

        }

        
        let text = UILabel()
        text.text = "Выгодно"
        text.font = UIFont(name: "SanFranciscoDisplay-Black", size: 13)
        text.font = text.font.withSize(20)
        text.textColor = .black
        self.addSubview(text)

        text.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(25)
            make.left.equalTo(view.snp.left).offset(16)
        }

        

        
    }

    
}

