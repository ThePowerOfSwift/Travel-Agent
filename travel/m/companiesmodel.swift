//
//  companiesmodel.swift
//  travel
//
//  Created by obada on 11/18/18.
//  Copyright © 2018 Abdo. All rights reserved.
//
/*
 "id": 101,
 "email": "reem@mo.com",
 "phone": "12345678901",
 "address": "Street 97، المنصورة (قسم 2)، المنصورة، الدقهلية، مصر",
 "lat": "31.042584",
 "lang": "-122.033373",
 "website": "www.reemtours.com",
 "language": "ar",
 "type": "company",
 "photo": "uploads/tDJY5IIom0.jpg",
 "approved": 1,
 "created_at": "2018-03-03 18:00:06",
 "updated_at": "2018-05-21 22:07:39",
 "subscription": "good",
 "start": "2018-05-21",
 "end": "2019-05-21",
 "facebook": "Reem Tours",
 "twitter": "",
 "youtube": "ReemTours",
 */











import UIKit
import SwiftyJSON
class companiesmodel: NSObject {
        var logo:String
        var name:String
    init?(dict: [String : JSON]) {
        guard let logoo = dict["photo"]?.string,let namee = dict["user_translation"]?[1]["name"].string else {
            print("from model")
            return nil
        }
    
        var base = "https://travelagenciesdeals.com/"
        self.logo = base+logoo
        self.name = namee
        

}
    

}
