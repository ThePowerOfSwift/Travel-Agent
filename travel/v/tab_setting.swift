
import UIKit

class tab_setting: UIViewController {
    
    @IBAction func password(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        def.removeObject(forKey: "ty")
        def.removeObject(forKey: "userid")
        
    }
        let def = UserDefaults.standard
    @IBAction func logout(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        def.removeObject(forKey: "ty")
        def.removeObject(forKey: "userid")
    }
    @IBAction func dollar(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "we work on it", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func change(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "we work on it", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
self.sidemenu.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func home(_ sender: Any) {
        
        
        
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

}
