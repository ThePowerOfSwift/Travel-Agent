//
//  bar_menu.swift
//  travel
//
//  Created by Abdo on 9/20/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip


class bar_menu: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewdisign()
        // Do any additional setup after loading the view.
    }

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "best")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "companies")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "famouse")
        
        return[child_1,child_2,child_3]
    }
    
    
    
    func loadViewdisign() {
        
        
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 0/255.0, green: 194/255.0, blue: 180/255.0, alpha: 1.0)
        
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.tintColor = UIColor.white
            
            
            newCell?.label.tintColor = UIColor.white
        }
    }

}
    



