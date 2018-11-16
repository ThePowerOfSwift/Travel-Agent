//
//  ViewControllercompany.swift
//  travel
//
//  Created by Abdo on 9/19/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ViewControllercompany: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}

extension ViewControllercompany : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Company")
    }
    
    
}
