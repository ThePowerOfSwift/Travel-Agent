//
//  retuernpassword.swift
//  travel
//
//  Created by Abdo on 9/18/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class retuernpassword: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
     let url = "https://travelagenciesdeals.com/api/sendmail"
    @IBOutlet weak var mail: UITextField!
    
    @IBAction func send(_ sender: Any) {
      
        if (mail.text?.isEmpty)!{
            let alert = UIAlertController(title: "Alert", message: "You need fill it  ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }else{send()}
        

        

        
        
    }
    
    
    
    
    func send(){
      
        var id = mail.text
        print("@@@@@@@@@@@@@@@@@@@@@@@@###############")
        let parm = [
            "email":id
        ]
        
        Alamofire.request(url, method: .post, parameters: parm, encoding: URLEncoding.default, headers: nil).responseJSON { re in
            switch re.result
            {
            case .failure(let erro):
                print("********////",erro)
            case .success(let value):
                
                let jsoncode = JSON(value)
                guard let data = jsoncode["success"].int else { return }
                if(data == 1){
                    let alert = UIAlertController(title: "Alert", message: "this address dont exist ", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    self.performSegue(withIdentifier: "check", sender: nil)
                    }
             
                
                
                
            }
        }
        
       
    }
    
    
}
