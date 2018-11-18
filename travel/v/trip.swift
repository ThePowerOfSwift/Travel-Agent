//
//  trip.swift
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

class trip: UITableViewController {
    
    let url = "https://travelagenciesdeals.com/api/trips"
    
    let ofeer = [trips]()
    
    var window: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        send()
        
    }
    
        //let sb = UIStoryboard(name: "login", bundle: nil)
        
        
    
       
       
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // #warning Incomplete implementation, return the number of sections
        let cellaya = tableView.dequeueReusableCell(withIdentifier: "cellaya", for: indexPath)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellaya", for: indexPaath)
        
        print("4444444444444444444444444444444")
        //cellay.date.text = "sdssddsdsdsddss"
        print(ofeer[indexPath.row])
        
        
        return cellaya
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ofeer.count
    }
/*
    func send(){
        var vc:UIViewController
        let def = UserDefaults.standard
        if let id = def.object(forKey: "userid") {
            
            print("@@@@@@@@@@@@@@@@@@@@@@@@###############")
            let parm = [
                "user_id":id
            ]
            
            Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
                switch re.result
                {
                case .failure(let erro):
                    print("********////",erro)
                case .success(let value):
                    
                    let jsoncode = JSON(value)
                    guard let data = jsoncode["data"].array else { return }
                    
                   /* for ofeer in data{
                        let trip = trips()
                        trip.date = (ofeer["date"].string)!
                        trip.logo = (ofeer["logo"].string)!
                        trip.photo = (ofeer["photo"].string)!
                        trip.price = (ofeer["price"].int)!
                        
                       */
  /*
                    }
                }
            }
            
        }else{
            print("+++++++++++++++++++++++++++++++++++++++")
            
        }
        
    }
*/
}

extension trip : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "famouse")
    }
    
    
}

*/
