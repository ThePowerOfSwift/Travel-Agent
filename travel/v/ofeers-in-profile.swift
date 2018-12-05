//
//  ofeers-in-profile.swift
//  travel
//
//  Created by Abdo on 9/25/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Kingfisher
class ofeers_in_profile: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    class cellHomeeee: UITableViewCell {}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellaya", for: indexPath)
        return cell
    }
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    var logooftripss :String = ""
    var picofcompanyss : String = ""
    var labeloftribss : String = ""
    @IBOutlet weak var add: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let def = UserDefaults.standard
        if let tybe:String = def.object(forKey: "ty") as? String{
            //     tybe = UserDefaults.standard.object(forKey: "user")
            let resourpic = NSURL(string:logooftripss )
            let resournewpic = ImageResource(downloadURL: resourpic! as URL)
            logo.kf.setImage(with: resournewpic)
            titel.text = labeloftribss
            if tybe == "user"{
                
                add.isHidden = true
                
            }else{add.isHidden = false}
        }
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
extension ofeers_in_profile : IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Offer")
    }
}


