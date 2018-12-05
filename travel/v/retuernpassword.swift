

import UIKit
import Alamofire
import SideMenu
import SwiftyJSON

class retuernpassword: UIViewController {

    @IBAction func BACK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
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
      
        let id = mail.text
        let parm = [
            "email":id
        ]
        
        Alamofire.request(url, method: .post, parameters: parm as Parameters, encoding: URLEncoding.default, headers: nil).responseJSON { re in
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
