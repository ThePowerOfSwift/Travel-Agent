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
class cellHomee: UITableViewCell{
    
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    
}

class bar_company: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellaya", for: indexPath)as! cellHomee
        
        print("4444444444444444444444444444444")
        
        
        
        
        cell.name.text = company[indexPath.row].name
        let resour = NSURL(string: company[indexPath.row].logo)
        let resournew = ImageResource(downloadURL: resour as! URL)
        
        
        
        cell.pic.kf.setImage(with: resournew)
        return cell
    }
     let url = "https://travelagenciesdeals.com/api/companies"
    var company = [companiesmodel]()
    @IBOutlet weak var hometabel: UITableView!
    @IBOutlet weak var profuleWithoutLogin: UIBarButtonItem!
    
    let def = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        send()
        // Do any additional setup after loading the view.
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    
    func send(){
        var vc:UIViewController
        let def = UserDefaults.standard
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
                guard let data = jsoncode["companies"].array else { return }
                
                for ofeers in data{
                    if let dataa = ofeers.dictionary,let trip = companiesmodel.init(dict:dataa){
                        
                        
                        self.company.append(trip)
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
        
        /* }else{
         print("+++++++++++++++++++++++++++++++++++++++")
         
         }
         */
    }
    
    
    
    @IBAction func showsidemenu(_ sender: Any) {
        if(self.sidemenu.isHidden == true){
            self.sidemenu.isHidden = false
            self.sidemenu.setNeedsLayout()
        }else{
            self.sidemenu.isHidden = true
        }
        
        
    }
    @IBOutlet weak var sidemenu: UIView!
    
    
}
extension bar_company : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "company")
    }
    
    
}
