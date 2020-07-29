//
//  KlapanCellsSubclass_2.swift
//  NomadShop
//
//  Created by Aldiyar Massimkhanov on 7/24/20.
//  Copyright © 2020 Aldiyaar. All rights reserved.
//

import Foundation
import UIKit

class KlapanCellSubclass_2: UICollectionViewCell {
    
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
        view.backgroundColor = .white

        self.addSubview(view)
        view.snp.makeConstraints { (make) in
            make.height.equalTo(132)
            make.width.equalTo(382)

        }
        
        let view_0 = UIView()
        let color_0 = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        view_0.backgroundColor = color_0


        self.addSubview(view_0)
        view_0.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.top.equalTo(view.snp.top).offset(16)
            make.left.equalTo(view.snp.left).offset(16)
        }


        
        let btn_1 = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "UnknowImage") {
            btn_1.setImage(image, for: .normal)
        }
        self.addSubview(btn_1)
        btn_1.snp.makeConstraints { (make) in
            make.top.equalTo(view_0.snp.top).offset(30)
            make.left.equalTo(view_0.snp.left).offset(30)



            make.width.equalTo(20)
            make.height.equalTo(20)
        

        }
                    
        let text_1 = UILabel()
        text_1.text = "ХГрузовая шина Нижнекамск Епмп ИН-1323БМ 9.00 R2"
        text_1.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_1.font = text_1.font.withSize(12)
        let color_1 = #colorLiteral(red: 0.5176470588, green: 0.5725490196, blue: 0.6509803922, alpha: 1)
        text_1.textColor = color_1
        self.addSubview(text_1)
        text_1.lineBreakMode = .byWordWrapping
        text_1.numberOfLines = 0

        text_1.snp.makeConstraints { (make) in
            make.width.equalTo(187)
            make.top.equalTo(view.snp.top).offset(16)
            make.left.equalTo(view.snp.left).offset(108)
        }
        
        let btn_2 = UIButton(type: .custom) as UIButton
        if let image = UIImage(named: "FavouriteIcon_2") {
            btn_2.setImage(image, for: .normal)
        }
        self.addSubview(btn_2)
        btn_2.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(16)
            make.right.equalTo(view.snp.right).offset(-15)

            make.width.equalTo(18)
            make.height.equalTo(16)
        }
        
        let text_2 = UILabel()
        text_2.text = "60 000 ₸"
        text_2.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        text_2.font = text_2.font.withSize(13)
        let color_2 = #colorLiteral(red: 0.1215686275, green: 0.1764705882, blue: 0.2392156863, alpha: 1)
        text_2.textColor = color_2
        self.addSubview(text_2)
        text_2.lineBreakMode = .byWordWrapping
        text_2.numberOfLines = 0

        text_2.snp.makeConstraints { (make) in
            make.width.equalTo(75)
            make.top.equalTo(view.snp.top).offset(62)
            make.left.equalTo(view.snp.left).offset(108)
        }
        
        let vertical_line = UILabel()
        vertical_line.text = "|"
        vertical_line.font = UIFont(name: "SanFranciscoDisplay-Black", size: 15)
        vertical_line.font = vertical_line.font.withSize(14)
        let color_3 = #colorLiteral(red: 0.8980392157, green: 0.9137254902, blue: 0.9490196078, alpha: 1)
        vertical_line.textColor = color_3
        self.addSubview(vertical_line)

        vertical_line.snp.makeConstraints { (make) in
            make.width.equalTo(5)
            make.top.equalTo(view.snp.top).offset(62)
            make.left.equalTo(view.snp.left).offset(195)
        }
        
        
        let view_3 = UIView()
        let color = #colorLiteral(red: 1, green: 0.8392156863, blue: 0, alpha: 1)
        view_3.backgroundColor = color
        view_3.layer.cornerRadius = 7


        self.addSubview(view_3)
        view_3.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(24)
            make.top.equalTo(view.snp.top).offset(56)
            make.left.equalTo(view.snp.left).offset(208)
        }

        let text_3 = UILabel()
        text_3.text = "7 345 ₸"
        text_3.font = UIFont(name: "SanFranciscoDisplay-Black", size: 10)
        text_3.font = text_3.font.withSize(10)
        text_3.textColor = color_2
        self.addSubview(text_3)
        text_3.lineBreakMode = .byWordWrapping
        text_3.numberOfLines = 0

        text_3.snp.makeConstraints { (make) in
            make.width.equalTo(44)
            make.top.equalTo(view.snp.top).offset(62)
            make.left.equalTo(view.snp.left).offset(216)
        }

        let text_4 = UILabel()
        text_4.text = "x 24 мес"
        text_4.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_4.font = text_4.font.withSize(11)
        let color_4 = #colorLiteral(red: 0.4941176471, green: 0.5529411765, blue: 0.6235294118, alpha: 1)
        text_4.textColor = color_4
        self.addSubview(text_4)

        text_4.snp.makeConstraints { (make) in
            make.width.equalTo(47)
            make.top.equalTo(view.snp.top).offset(62)
            make.left.equalTo(view.snp.left).offset(272)
        }
        
        let starIcon = UIImageView()
        starIcon.image = UIImage(named: "StarIcon")

        self.addSubview(starIcon)
        starIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(98)
            make.left.equalTo(view.snp.left).offset(108)

            make.width.equalTo(12)
            make.height.equalTo(11.44)
        }
        
        let text_6 = UILabel()
        text_6.text = "4.9"
        text_6.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_6.font = text_4.font.withSize(13)
        let color_6 = #colorLiteral(red: 0.2352941176, green: 0.2823529412, blue: 0.3450980392, alpha: 1)
        text_6.textColor = color_6
        self.addSubview(text_6)

        text_6.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(96)
            make.left.equalTo(view.snp.left).offset(126)
        }

        let text_7 = UILabel()
        text_7.text = "(39)"
        text_7.font = UIFont(name: "SanFranciscoDisplay-Black", size: 11)
        text_7.font = text_4.font.withSize(13)
        text_7.textColor = color_1
        self.addSubview(text_7)

        text_7.snp.makeConstraints { (make) in
            make.width.equalTo(27)
            make.top.equalTo(view.snp.top).offset(96)
            make.left.equalTo(view.snp.left).offset(152)
        }

        let ellipse = UIImageView()
        ellipse.image = UIImage(named: "ellipse")
        self.addSubview(ellipse)
        ellipse.snp.makeConstraints { (make) in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.top.equalTo(view.snp.top).offset(95)
            make.left.equalTo(view.snp.left).offset(199)
        }
        
        let icon = UIImageView()
        icon.image = UIImage(named: "AutoNomadIcon")
        self.addSubview(icon)
        icon.snp.makeConstraints { (make) in
            make.width.equalTo(10.5)
            make.height.equalTo(10)
            make.top.equalTo(ellipse.snp.top).offset(5)
            make.left.equalTo(ellipse.snp.left).offset(5)
        }
        
        let text_8 = UILabel()
        text_8.text = "Formula store"
        text_8.font = UIFont(name: "SanFranciscoDisplay-Black", size: 10)
        text_8.font = text_8.font.withSize(13)
        text_8.textColor = color_1
        self.addSubview(text_8)

        text_8.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(96)
            make.left.equalTo(view.snp.left).offset(225)
        }




        let view_5 = UIView()
        let color_5 = #colorLiteral(red: 0.7607843137, green: 0.2705882353, blue: 0.2431372549, alpha: 1)
        view_5.backgroundColor = color_5
        view_5.layer.cornerRadius = 10


        self.addSubview(view_5)
        view_5.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(26)
            make.top.equalTo(view.snp.top).offset(94)
            make.left.equalTo(view.snp.left).offset(26)
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
    
    
}





