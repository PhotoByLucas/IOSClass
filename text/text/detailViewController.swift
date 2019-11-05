//
//  detailViewController.swift
//  text
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qhp. All rights reserved.
//

import UIKit

class detailViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var textImage: UIImageView!
    
    @IBOutlet weak var number: UITextField!
    var textForEdit:text?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name.text = textForEdit?.name
        self.number.text = textForEdit?.number
        self.textImage.image = textForEdit?.textAvatar
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedIamge = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.textImage?.image = selectedIamge
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList"{
            print("save")
            textForEdit=text(name: self.name.text!,
                             number: self.number.text!,
                textAvatar: self.textImage.image!)
        }
        if segue.identifier == "cancelToList"{
            print("cancel")
        }
    }
    

}
