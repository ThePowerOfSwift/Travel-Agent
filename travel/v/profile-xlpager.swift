//
//  profile-xlpager.swift
//  travel
//
//  Created by Abdo on 9/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class profile_xlpager: ButtonBarPagerTabStripViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            loadViewdisign()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "offer")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "travel")
        let child_3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "info")
        
        return[child_1,child_2,child_3]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func loadViewdisign() {
        
        
        settings.style.buttonBarItemBackgroundColor = UIColor(red: 0/255.0, green: 194/255.0, blue: 180/255.0, alpha: 1.0)
        
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.tintColor = UIColor.white
            
            
            newCell?.label.tintColor = UIColor.white
        }
    }
}
