//
//  CategoriesTableViewController.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/17/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import UIKit
import Foundation



class CategoriesTableViewController: UIViewController {

    var tableView = UITableView()
    var categories: [Category] = []
    
    struct Cells {
        static let categoryCell = "CategoriesCell"
    }
    
    override func viewDidLoad () {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden =  false
        self.title = "Все категории"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "SanFranciscoDisplay-Black", size: 20) ?? UIFont.systemFont(ofSize: 18)]
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

//        self.title = "Главная передача"
//        self.navigationController?.navigationBar.largeTitleTextAttributes = [
//            NSAttributedString.Key.foregroundColor: UIColor.black,
//            NSAttributedString.Key.font : UIFont(name: "SanFranciscoDisplay-Black", size: 18) ?? UIFont.systemFont(ofSize: 18)]
//
//
//        for navItem in(self.navigationController?.navigationBar.subviews)! {
//             for itemSubView in navItem.subviews {
//                 if let largeLabel = itemSubView as? UILabel {
//                     largeLabel.text = self.title
//                     largeLabel.numberOfLines = 0
//                     largeLabel.lineBreakMode = .byWordWrapping
//                 }
//             }
//        }



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
extension CategoriesTableViewController: UITableViewDelegate, UITableViewDataSource {
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
        if indexPath.row == 4{
            let nextVC = CategoriesVC_5()
            navigationController?.pushViewController(nextVC, animated: true)
        }
        else{
          let nextVC = HomeController()
          navigationController?.pushViewController(nextVC, animated: true)
        }


    }



}


extension CategoriesTableViewController {
    func fetchData() -> [Category] {
        let category1 = (Category(title: "Интеграл регулировки", image: UIImage.init(named: "Arrow-1")!))
        let category2 = (Category(title: "Амортизатор", image: UIImage(named: "Arrow-1")!))
        let category3 = (Category(title: "Батарея", image: UIImage(named: "Arrow-1")!))
        let category4 = (Category(title: "Вентилятор", image: UIImage(named: "Arrow-1")!))
        let category5 = (Category(title: "Главвная передача", image: UIImage(named: "Arrow-1")!))

        return [category1, category2, category3, category4, category5]
    }
}
