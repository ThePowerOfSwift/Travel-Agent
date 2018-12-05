//
//  login.swift
//  travel
//
//  Created by Abdo on 9/16/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class login: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
      
    }

   
    
    @IBOutlet weak var mail: UITextField!
   
    @IBOutlet weak var password: UITextField!
    let url = "https://travelagenciesdeals.com/api/login"
    let defult =  UserDefaults.standard
    @IBAction func login(_ sender: Any) {
        
        
        guard let mail = mail.text, !mail.isEmpty else{return}
        guard let pas = password.text else{return}
        
        if  pas.isEmpty {
            if mail.isEmpty {
                let alert = UIAlertController(title: "Alert", message: "please compleate fields", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
            let alert = UIAlertController(title: "Alert", message: "please check your password", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        let parm = [
            "email":mail,
            "password":pas
        
        ]
        Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
            switch re.result
            {
            case .failure(let erro):
                print("********////",erro)
            case .success(let value):
                let jsoncode = JSON(value)
                if let id = jsoncode["user"]["id"].int{
                    self.defult.setValue(id, forKey: "userid")
                    if let tybe = jsoncode["user"]["type"].string{
                        self.defult.setValue(tybe, forKey: "ty")
                    }
                   self.performSegue(withIdentifier: "loginggo", sender: self)
                }
                else{
                    let alert = UIAlertController(title: "Alert", message: "please check your data", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }

}
