//
//  imgpicker.swift
//  travel
//
//  Created by obada on 10/2/18.
//  Copyright © 2018 Abdo. All rights reserved.
//

import UIKit

class imgpicker: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var img: UIImageView!
    var imgpickerr = UIImagePickerController()
    @IBAction func bu(_ sender: Any) {
        let action = UIAlertController(title: "photo sourse", message: "chose", preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "camera", style: .default, handler: { (action:UIAlertAction) in
            
        }))
        
        action.addAction(UIAlertAction(title: "photolirary", style: .default, handler: { (action:UIAlertAction) in
            
        }))
        
        action.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        
        self.present(action, animated: true, completion: nil)
        
        
        
        /*
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum) {
            print("bution capt")
            imgpickerr.delegate = self
            imgpickerr.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
            imgpickerr.allowsEditing = false
            self.present(imgpickerr, animated: true, completion: nil)
        }*/
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

       let imgg = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        img.image = imgg
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
