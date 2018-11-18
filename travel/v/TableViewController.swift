//
//  TableViewController.swift
//  travel
//
//  Created by obada on 10/12/18.
//  Copyright © 2018 Abdo. All rights reserved.
//
/*
import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ofeer = [trips]()
     
        send()
        
        
        // MARK: - Table view data source
        

}
    func send(){
        var vc:UIViewController
        let def = UserDefaults.standard
        if let id = def.object(forKey: "userid") {
            
            print("@@@@@@@@@@@@@@@@@@@@@@@@###############")
            let parm = [
                "user_id":id
            ]
            let url = "https://travelagenciesdeals.com/api/trips"
            Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
                switch re.result
                {
                case .failure(let erro):
                    print("********////",erro)
              /*  case .success(let value):
                    
                    let jsoncode = JSON(value)
                    guard let data = jsoncode["data"].array else { return }
                    
                 /*   for ofeer in data{
                        let trip = trips(dic: <#[String : JSON]#>)
                        trip?.date = (ofeer["date"].string)!
                        trip?.logo = (ofeer["logo"].string)!
                        trip?.photo = (ofeer["photo"].string)!
                        trip?.price = (ofeer["price"].int)!
                        
                        
                        
                    }*/
                }
            }
            
        }else{
            print("+++++++++++++++++++++++++++++++++++++++")
            
        }
        
}
}
*/
