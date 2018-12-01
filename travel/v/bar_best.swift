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

 class cellHomeee: UITableViewCell {
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var fav: UIButton!
    
    var openProfileActionadd : (()->())?
    
    @IBAction func penProfileActionadd(_ sender: UIButton) {
        openProfileActionadd?()
    }
    var openProfileAction : (()->())?
    
    @IBAction func penProfileAction(_ sender: UIButton) {
        openProfileAction?()
    }
    
}

class bar_best : UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ofeer.count
        
    }
    
    let urldlettri = "https://travelagenciesdeals.com/api/unfavorite_offer"
    let url = "https://travelagenciesdeals.com/api/trips"
      let urltri = "https://travelagenciesdeals.com/api/favorite_offer"
    var ofeer = [besttrips]()
    @IBOutlet weak var hometabel: UITableView!
        
    @IBOutlet weak var ProfilWithoutLogin: UIBarButtonItem!
    @IBOutlet weak var profileuser: UIBarButtonItem!
    
    @IBOutlet weak var profilecompany: UIBarButtonItem!
   
    
    
    
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellay = tableView.dequeueReusableCell(withIdentifier: "cellaya" , for: indexPath)as! cellHomeee
        
        print(ofeer[indexPath.row].date)
        cellay.date.text = ofeer[indexPath.row].date
        cellay.price.text = String(ofeer[indexPath.row].price)
        cellay.titel.text = ofeer[indexPath.row].titel
        
        
        let resour = NSURL(string: ofeer[indexPath.row].logo)
        let resournew = ImageResource(downloadURL: resour! as URL)
        
        let resourpic = NSURL(string: ofeer[indexPath.row].photo)
        let resournewpic = ImageResource(downloadURL: resourpic! as URL)
       
        
       // cellay.fav.addTarget(self, action:#selector(bar_best.connected(sender: cellay.fav)), for: .touchUpInside)
       
        
        
        
        
        // hna fe 7aga asmha imgresou
        cellay.logo.kf.setImage(with: resournew)
        cellay.photo.kf.setImage(with: resournewpic)
        let tripid = ofeer[indexPath.row].id
       // cellay.fav.addTarget(self, action:#selector(bar_best.fa), for: UIControl.Event.touchUpInside)
        
        cellay.openProfileActionadd = {
            
            if cellay.fav.currentImage == UIImage(named: "unlike") {
            self.addfovo(idtri: tripid)
                cellay.fav.setImage(UIImage(named: "menu bar-fav"), for: .normal)}else{
                self.unfovo(idtri: tripid)
                cellay.fav.setImage(UIImage(named: "unlike"), for: .normal)            }
            
           
            }
        cellay.openProfileAction = {
            
        }
        
        
        
        return cellay
    }

    @IBAction func action(_ sender: Any) {
        
        if let tybe:String = def.object(forKey: "ty") as? String{
            //     tybe = UserDefaults.standard.object(forKey: "user")
            
            if tybe == "user"{
                performSegue(withIdentifier: "user", sender: nil)
                
            }else{
                performSegue(withIdentifier: "company", sender: nil)
            }
            
            print(tybe)
        }else{
            
            performSegue(withIdentifier: "withoutloginin", sender: nil)
            
            
        }
        
        
    }

    @IBAction func sidemenu(_ sender: Any) {
        if(self.sidemenu.isHidden == true){
            self.sidemenu.isHidden = false
            self.sidemenu.setNeedsLayout()
        }else{
            self.sidemenu.isHidden = true
        }
    }
    
    
    
    @IBOutlet weak var sidemenu: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        send()
        
        // Do any additional setup after loading the view.
    }
  


    var deleget = ""
    var delegetun = ""
let def = UserDefaults.standard
    func addfovo(idtri:Int) {
        
        
        if let id = def.object(forKey: "userid")  {
            
            let parm = [
                "user_id":id,
                "offer_id":idtri
            ]
            
            
            Alamofire.request(urltri, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
                switch re.result
                {
                case .failure(let erro):
                    print("********////",erro)
                case .success(let value):
                    
                    let jsoncode = JSON(value)
                    guard let data = jsoncode["success"].int else { return }
                    
                    
                    if data == 1 {
                        
                        
                        self.deleget = "done"
                        
                        print("done")
                        
                    }else{self.deleget = "not work"}
                    self.hometabel.reloadData()
                    
                    
                    
                    
                    
                }
                
                
                
            }
        }
        
    }

    
    func unfovo(idtri:Int) {
        
        let def = UserDefaults.standard
        if let id = def.object(forKey: "userid")  {
            
            let parm = [
                "user_id":id,
                "offer_id":idtri
            ]
            
            
            Alamofire.request(urldlettri, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
                switch re.result
                {
                case .failure(let erro):
                    print("********////",erro)
                case .success(let value):
                    
                    let jsoncode = JSON(value)
                    guard let data = jsoncode["success"].int else { return }
                    
                    
                    if data == 1 {
                        
                        
                        self.delegetun = "doneun"
                        
                        print("done")
                        
                    }else{self.delegetun = "not work"}
                    self.hometabel.reloadData()
                    
                    
                    
                    
                    
                }
                
                
                
            }
        }
        
    }

    
    
    func send(){
        var vc:UIViewController
        let def = UserDefaults.standard
        if let id = def.object(forKey: "userid")  {
        
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
                    self.hometabel.reloadData()
                    
                    
                    /*
                     trip.date = (ofeer["date"].string)!
                     trip.logo = (ofeer["logo"].string)!
                     trip.photo = (ofeer["photo"].string)!
                     trip.price = (ofeer["price"].int)!
                     */
                    
                }
                }
                
                
                
            }
        }
        
        /* }else{
         print("+++++++++++++++++++++++++++++++++++++++")
         
         }
         */
    }
}







extension bar_best : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Best Offer")
    }
    

    
    
    
}
