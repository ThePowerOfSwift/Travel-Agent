//
//  bar_best.swift
//  travel
//
//  Created by Abdo on 9/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Alamofire
import SwiftyJSON
import Kingfisher

class cellHome: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var price: UILabel!
    
}
class ViewController_main_menu: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        send()
        /* let parm = [
         "user_id":,
         
         
         ]*/
        // Do any additional setup after loading the view.
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellay = tableView.dequeueReusableCell(withIdentifier: "cellaya" , for: indexPath) as! cellHome
        cellay.lblDate.text = ofeer[indexPath.row].date
        cellay.price.text = String(ofeer[indexPath.row].price)
       cellay.titel.text = ofeer[indexPath.row].titel
        let resour = NSURL(string: ofeer[indexPath.row].logo)
        let resournew = ImageResource(downloadURL: resour as! URL)

        let resourpic = NSURL(string: ofeer[indexPath.row].photo)
        let resournewpic = ImageResource(downloadURL: resour as! URL)


        cellay.pic.kf.setImage(with: resournew)
        cellay.photo.kf.setImage(with: resournewpic)
        return cellay
        
        
    }
    
    
    
  
  
    
     let url = "https://travelagenciesdeals.com/api/trips"
    
    
    @IBOutlet weak var homeTable: UITableView!
    
    var ofeer = [besttrips]()
    
    
    var window: UIWindow?
  
    
    
    func send(){
        //var vc:UIViewController
       // let def = UserDefaults.standard
       // if let id = def.object(forKey: "userid")  {
                var id = 0
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
                    
                    for ofeers in data{
                        if let dataa = ofeers.dictionary,let trip = besttrips.init(dict:dataa){
                        
                            
                           self.ofeer.append(trip)
                            print("done")
                            
                        }else{print("ggggggggggggogoggoggg")}
                        self.homeTable.reloadData()

                        
                        /*
                            trip.date = (ofeer["date"].string)!
                            trip.logo = (ofeer["logo"].string)!
                            trip.photo = (ofeer["photo"].string)!
                            trip.price = (ofeer["price"].int)!
                        */
                        
                        
                    }
                    
                    
                    
                }
            }
            
       /* }else{
            print("+++++++++++++++++++++++++++++++++++++++")
         
        }
        */
    }
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ofeer.count
    }
    

    

}

extension ViewController_main_menu : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Trips")
}

}
