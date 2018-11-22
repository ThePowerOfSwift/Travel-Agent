//
//  changepass.swift
//  travel
//
//  Created by obada on 11/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class changepass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let url = "https://travelagenciesdeals.com/api/resetpassword"
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    @IBAction func send(_ sender: Any) {
        
        if (mail.text?.isEmpty)!{
            if (pass.text?.isEmpty)!{
                let alert = UIAlertController(title: "Alert", message: "You need fill it  ", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }else{send()
            print("dp**********************")
        }
        
        
        
        
        
        
    }
    
    
    
    
    func send(){
        
        var id = mail.text
        var codee = pass.text
        print("@@@@@@@@@@@@@@@@@@@@@@@@###############")
        let parm = [
            "email":id,
            "password" :codee
            
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
                    self.performSegue(withIdentifier: "done", sender: nil)
                }
                
                
                
                
            }
        }
        
        
    }


}
