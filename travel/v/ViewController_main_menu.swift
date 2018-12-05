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
    var openProfileActionadd : (()->())?
    
    @IBAction func penProfileActionadd(_ sender: UIButton) {
        openProfileActionadd?()
    }
    
}
class ViewController_main_menu: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBAction func action(_ sender: Any) {
        
        if let tybe:String = def.object(forKey: "ty") as? String{
            //     tybe = UserDefaults.standard.object(forKey: "user")
            
            if tybe == "user"{
                performSegue(withIdentifier: "user", sender: nil)
                
            }else{
              performSegue(withIdentifier: "company", sender: nil)
            }
            
           
        }else{
            
           performSegue(withIdentifier: "withoutloginin", sender: nil)
            
            
        }
        
        
    }
    
    
   
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
        
        
        cellay.openProfileActionadd = {

            
            self.picofcompanys = self.ofeer[indexPath.row].photo
            self.detailsontrips = self.ofeer[indexPath.row].detailss
            self.labeloftribs = self.ofeer[indexPath.row].titel
            self.priceoftribs = self.ofeer[indexPath.row].price
            self.logooftrips = self.ofeer[indexPath.row].logo
            if self.priceoftribs != 0 {
            self.performSegue(withIdentifier: "detalissegue", sender: self)
                
            }else{}
        }
        
        return cellay
        
        
    }
    

    
    
  
    
    
    let url = "https://travelagenciesdeals.com/api/trips"
    
    
    @IBOutlet weak var homeTable: UITableView!
    
    var ofeer = [besttrips]()
    
    
    var window: UIWindow?
    var logooftrips :String = ""
    var picofcompanys : String = ""
    var labeloftribs : String = ""
    var priceoftribs : Int = 0
    var detailsontrips : String = ""
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let detailss = segue.destination as! details
            
            detailss.detailsontripss = detailsontrips
            detailss.picofcompanyss = picofcompanys
            detailss.labeloftribss = labeloftribs
            detailss.priceoftribss = priceoftribs
            detailss.logooftripss = logooftrips
        }else{return}
        
    
//        detailss.price.text = String(priceoftribs)
//        detailss.picofcompany = picofcompanys
//        detailss.logo = logooftrips

    }
     let def = UserDefaults.standard
    func send(){
        //var vc:UIViewController
       
        if let id = def.object(forKey: "userid")  {
    
            
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
                            
                            
                        }else{return}
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
            
        }else{
            return
         
        }
    
    }
        
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ofeer.count
    }
    
    @IBAction func showsidemenu(_ sender: Any) {
        if(self.sidemenu.isHidden == true){
            self.sidemenu.isHidden = false
            self.sidemenu.setNeedsLayout()
        }else{
            self.sidemenu.isHidden = true
        }
        
    }
    @IBAction func logout(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        def.removeObject(forKey: "ty")
        def.removeObject(forKey: "userid")
        
    }
    @IBOutlet weak var sidemenu: UIView!
    

}

extension ViewController_main_menu : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Trips")
}

}
