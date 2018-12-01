//
//  tab_setting.swift
//  travel
//
//  Created by Abdo on 9/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class tab_setting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func home(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "favo")as UIViewController
        
        
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
