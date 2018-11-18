//
//  ViewController11.swift
//  travel
//
//  Created by Abdo on 9/23/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class ViewController11: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
side()
        // Do any additional setup after loading the view.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var aert: UIButton!
    @IBOutlet var menue: UIButton!
    func side() {
        if revealViewController() != nil {
            print("done")
            
            menue.target(forAction: #selector(SWRevealViewController.revealToggle(_:)), withSender: revealViewController())
            
            revealViewController().rearViewRevealWidth = 200
            revealViewController().rightViewRevealWidth = 160
            
           view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }else{print("no")}
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
