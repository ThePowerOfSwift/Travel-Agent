//
//  checkcodeViewController.swift
//  travel
//
//  Created by obada on 11/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class checkcodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    let url = "https://travelagenciesdeals.com/api/checkcode"
    @IBOutlet weak var mail: UITextField!
    @IBOutlet weak var code: UITextField!
    @IBAction func BACK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func send(_ sender: Any) {
        
        if (mail.text?.isEmpty)!{
            if (code.text?.isEmpty)!{
            let alert = UIAlertController(title: "Alert", message: "You need fill it  ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        }else{send()
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    func send(){
        
        var id = mail.text
       var codee = code.text
        let parm = [
            "email":id,
            "code" :codee
            
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
                    self.performSegue(withIdentifier: "last", sender: nil)
                }
                
                
                
                
            }
        }
        
        
    }

    
    
    

}
