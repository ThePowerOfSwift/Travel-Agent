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
        
        // Do any additional setup after loading the view.
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

}
