//
//  descriptionViewController.swift
//  tableView
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qcx. All rights reserved.
//

import UIKit

class descriptionViewController: UIViewController,
UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptText: UITextField!
   // @IBOutlet weak var foodImage:UIImageView?
    
    @IBOutlet weak var foodImage: UIImageView!
    var foodForEdit :food?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameText!.text=foodForEdit?.name
        self.descriptText!.text=foodForEdit?.foodDescription
        self.foodImage?.image=foodForEdit?.foodAvatar
        // Do any additional setup after loading the view.
    //    self.nameText.text=foodForEdit?.name
    //    self.descriptionText.text=foodForEdit?.description
       // self.navigationItem.title=foodForEdit?.name
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="saveToList"
        {
            print("save")
            foodForEdit=food(name: self.nameText.text!, foodDescription: self.descriptText.text!
            ,foodAvatar: self.foodImage?.image)
        }
        if segue.identifier=="cancelToList"
        {
            print("cancel")
        }
    }
   /*
    @IBAction func takePhoto(_ sender: Any)
    {
     
    }*/
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker=UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate=self
        present(imagePicker,animated: true,completion: nil)
    }
    /*
    @IBAction func tapPhoto(_ sender: Any)
    {
     
    }*/
    
    
    @IBAction func tapPhoto(_ sender: Any) {
        let imagePicker=UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate=self
        present(imagePicker,animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage =
            info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        self.foodImage?.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
}
