//
//  details.swift
//  travel
//
//  Created by obada on 11/27/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit
import Kingfisher

class details: UIViewController {

    @IBOutlet weak var book: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var companypic: UIImageView!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var detai: UILabel!
    @IBOutlet weak var setting: UIBarButtonItem!
   
    @IBAction func BACK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detai.text = detailsontripss
        label.text = labeloftribss
        price.text = String(priceoftribss)
        let resourpic = NSURL(string:picofcompanyss )
        let resournewpic = ImageResource(downloadURL: resourpic! as URL)
        companypic.kf.setImage(with: resournewpic)
        
        let resour = NSURL(string:logooftripss )
        let resournew = ImageResource(downloadURL: resour! as URL)
        pic.kf.setImage(with: resournew)
        
        detai.text = detailsontripss
        
    }
    
    @IBAction func booking(_ sender: Any) {
        
      print("no API")
    }
    var logooftripss :String = ""
    var picofcompanyss : String = ""
    var labeloftribss : String = ""
    var priceoftribss : Int = 0
    var detailsontripss : String = ""
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
