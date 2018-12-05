//
//  tab_favo.swift
//  travel
//
//  Created by Abdo on 9/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class tab_favo: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellaya", for: indexPath)
        return cell
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

    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Alert", message: "NO API", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        self.sidemenu.isHidden = true
        // Do any additional setup after loading the view.
    }

   

}
