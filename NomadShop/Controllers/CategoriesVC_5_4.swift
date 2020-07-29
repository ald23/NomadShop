//
//  CategoriesVC_4.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/22/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit



class CategoriesVC_5_4: UIViewController {

    var tableView = UITableView()
    var categories: [Category] = []
    
    struct Cells {
        static let categoryCell = "CategoriesCell"
    }
    
    override func viewDidLoad () {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden =  false
        self.title = "Механизм газораспределения"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "SanFranciscoDisplay-Black", size: 20) ?? UIFont.systemFont(ofSize: 18)]

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)



        categories = fetchData()
        configureTableView()
//        setupNavBar()
    }
    
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 72
        tableView.register(CategoriesCell.self, forCellReuseIdentifier: Cells.categoryCell)
        tableView.pin(to: view)
        tableView.separatorColor = .clear
        tableView.backgroundColor = .white
//        tableView.snp.makeConstraints { (make) in
//            make.left.equalTo(2)
//            make.right.equalTo(2)
//            make.top.equalTo(2)
//
//        }



    }
    
    func setTableViewDelegates()  {
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    
//    func setupNavBar() {
//        let nav1 = UINavigationController()
//        let label = UILabel(frame: nav1.navigationBar.frame)
//        label.font = UIFont(name: "SanFranciscoDisplay-Black", size: 17)
//        label.text="Все категории"
//        label.textColor = UIColor.black
//        for item in nav1.navigationBar.items!{
//          item.titleView = label
//        }
//
//
//    }
    
}
extension CategoriesVC_5_4: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.categoryCell) as! CategoriesCell
        let category = categories[indexPath.row]
        cell.set(category: category)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // this will turn on `masksToBounds` just before showing the cell
        cell.contentView.layer.masksToBounds = true
        let radius = cell.contentView.layer.cornerRadius
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          print("row: \(indexPath.row)")
       if indexPath.row == 1{
        let newController = KlapanCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
        self.navigationController?.pushViewController(newController, animated: true)

       }
       else{
         let nextVC = HomeController()
         navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }



}


extension CategoriesVC_5_4 {
    func fetchData() -> [Category] {
        let category1 = (Category(title: "Все товары механизма", image: UIImage.init(named: "Arrow-1")!))
        let category2 = (Category(title: "Клапан / регулировка", image: UIImage(named: "Arrow-1")!))
        let category3 = (Category(title: "Приведение в действие клапанов", image: UIImage(named: "Arrow-1")!))
        let category4 = (Category(title: "Коромысло / балансир", image: UIImage(named: "Arrow-1")!))
        let category5 = (Category(title: "Комплект цели привода распредвала", image: UIImage(named: "Arrow-1")!))

        return [category1, category2, category3, category4, category5]
    }
}
