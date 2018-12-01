//
//  bestofers.swift
//  travel
//
//  Created by obada on 12/17/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import SwiftyJSON

class besttrips: NSObject {
    var price: Int
    var date: String
    var section : String = ""
    var photo:String
    var logo:String
    var web:String = ""
    var titel : String
    var id : Int
    var detailss : String
    
    init?(dict: [String : JSON]) {
        guard let pricee = dict["price"]?.int,let datee = dict["date"]?.string,let logoo = dict["logo"]?.string,let photoo = dict["photo"]?.string,let titell = dict["triptranslation"]?[1]["title"].string,
            let detail = dict["triptranslation"]?[1]["details"].string, let idd = dict["id"]?.int else {
        print("from model")
            return nil
        }
        var base = "https://travelagenciesdeals.com/"
        self.date = datee
        self.price = pricee
        self.logo = base+logoo
        self.photo = base+photoo
        self.titel = titell
        self.id = idd
        self.detailss = detail
    }
    
}
