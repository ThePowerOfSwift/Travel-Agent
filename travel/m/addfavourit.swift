//
//  addfavourit.swift
//  travel
//
//  Created by obada on 11/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import SwiftyJSON


class addfavourit: UIViewController {

    var user : Int
    var trip  : Int

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








