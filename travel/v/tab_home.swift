//
//  tab_home.swift
//  travel
//
//  Created by Abdo on 9/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class tab_search: UIViewController {
    
    
    
    @IBAction func exchange(_ sender: Any) {
        var from = self.from.text
        var to = self.to.text
        self.to.text = from
        self.to.text = to
    }
    
    /*
     
     no data result from postMan
     */

    @IBOutlet weak var fromdate: UITextField!
    @IBOutlet weak var todate: UITextField!
    @IBOutlet weak var excahnge: UIButton!
    
    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!
    @IBOutlet weak var companyname: UITextField!
    @IBOutlet weak var adults: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createdatepicker()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    var datepicker = UIDatePicker()
    let url = "https://travelagenciesdeals.com/api/search"
    func createdatepicker() {
        datepicker.datePickerMode = .date
        
        let tollbar = UIToolbar()
        let tollbar1 = UIToolbar()
        tollbar.sizeToFit()
        tollbar1.sizeToFit()
        
        let donebuttonfrom = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneac))
        tollbar.setItems([donebuttonfrom], animated: true)
        fromdate.inputAccessoryView = tollbar
        
       fromdate.inputView = datepicker
       let donebuttonto = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneacto))
        tollbar1.setItems([donebuttonto], animated: true)
        todate.inputAccessoryView = tollbar1
        
        todate.inputView = datepicker
    }
    
    @objc func doneac() {
        
        fromdate.text = "\(datepicker.date)"
        self.view.endEditing(true)
    }
    @objc func doneacto() {
        todate.text = "\(datepicker.date)"
        
        self.view.endEditing(true)
    }
    
    @IBAction func send(_ sender: Any) {
        guard (from.text?.isEmpty)!,(fromdate.text?.isEmpty)!,(todate.text?.isEmpty)!,(to.text?.isEmpty)!,(companyname.text!.isEmpty),(adults.text!.isEmpty)  else {
            send()
        return
        }
        
        
        let alert = UIAlertController(title: "Alert", message: "You need fill it  ", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    
    }
  
    func send(){
        
        var from = self.from.text
        var to = self.to.text
        var fromdate = self.fromdate.text
        var todate = self.todate.text
        var name = companyname.text
        var adult = adults.text
        
        let parm = [
            "company_name":name,
            "section" :"study",
            "type":"go",
            "from_date":fromdate,
            "to_date":todate
            
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
            switch re.result
            {
            case .failure(let erro):
                print("********////",erro)
            case .success(let value):
                
                let jsoncode = JSON(value)
                guard let data = jsoncode["search_results"].array else { return }
                if(data.count == 0){
                    let alert = UIAlertController(title: "Alert", message: "we dont have trip in your order ", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    //self.performSegue(withIdentifier: "done", sender: nil)
                }
                
                
                
                
            }
        }
        
        
    }



}
