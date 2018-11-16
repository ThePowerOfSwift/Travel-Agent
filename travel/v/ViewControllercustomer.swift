//
//  ViewControllercustomer.swift
//  travel
//
//  Created by Abdo on 9/19/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewControllercustomer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBOutlet var menu: UIView!
    @IBAction func sidemenu(_ sender: Any) {
        if menu.frame.size.width == 220 {
            menu.frame.size.width = 0
        }
        menu.frame.size.width = 220
    
    }
    
}


extension ViewControllercustomer : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Customer")
    }
 
    
}
