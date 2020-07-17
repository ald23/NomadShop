////
////  Models.swift
////  NomadShop
////
////  Created by Aldiyar Massimkhanov on 7/15/20.
////  Copyright © 2020 Aldiyaar. All rights reserved.
////
//
import UIKit


class Banner: NSObject {
    var thumbnailImageName: String?
    var title: String?
}

struct Product {

    var productName : String
    var productImage : UIImage
    var productDesc : String
}
