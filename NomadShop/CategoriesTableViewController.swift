//
//  CategoriesTableViewController.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/17/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit

class CategoriesTableViewController: UITableViewController {
    
    let cellId = "cellId"
    var products : [Product]  = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        createProductArray()
        tableView.register(ProductCell.self, forCellReuseIdentifier: cellId)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ProductCell
        let currentLastItem = products[indexPath.row]
        cell.product = currentLastItem
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func createProductArray() {
        products.append(Product(productName: "Glasses", productImage: #imageLiteral(resourceName: "glasses") , productDesc: "This is best Glasses I've ever seen"))
        products.append(Product(productName: "Desert", productImage: #imageLiteral(resourceName: "desert") , productDesc: "This is so yummy"))
        products.append(Product(productName: "Camera Lens", productImage:  #imageLiteral(resourceName: "cameralens"), productDesc: "I wish I had this camera lens"))
    }
}



protocol ProductCellDelegate {
    func increaseNumber(cell: ProductCell,number : Int)
    func decreaseNumber(cell: ProductCell,number : Int)
}

class ProductCell : UITableViewCell {
    var delegate : ProductCellDelegate?
    let minValue = 0
    
    var product : Product? {
        didSet {
            productImage.image = product?.productImage
            productNameLabel.text = product?.productName
            productDescriptionLabel.text = product?.productDesc
        }
    }
    
    
    private let productNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let productDescriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let decreaseButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "minusTb"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    private let increaseButton : UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(#imageLiteral(resourceName: "addTb"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    var productQuantity : UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label
        
    }()
    
    private let productImage : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "glasses"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    @objc func decreaseFunc() {
        changeQuantity(by: -1)
        
    }
    
    @objc func increaseFunc() {
        changeQuantity(by: 1)
    }
    
    
    func changeQuantity(by amount: Int) {
        var quality = Int(productQuantity.text!)!
        quality += amount
        if quality < minValue {
            quality = 0
            productQuantity.text = "0"
        } else {
            productQuantity.text = "\(quality)"
        }
        delegate?.decreaseNumber(cell: self, number: quality)
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(decreaseButton)
        addSubview(productQuantity)
        addSubview(increaseButton)
        
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        let stackView = UIStackView(arrangedSubviews: [decreaseButton,productQuantity,increaseButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        
        increaseButton.addTarget(self, action: #selector(increaseFunc), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decreaseFunc), for: .touchUpInside)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
            print("Top: \(topInset)")
            print("bottom: \(bottomInset)")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}


