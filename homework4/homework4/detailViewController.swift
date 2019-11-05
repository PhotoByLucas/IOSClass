//
//  detailViewController.swift
//  homework4
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class detailViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var moneyText: UITextField!
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    
    @IBAction func tabPhoto(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.pictureView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    var listForEdit: list?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.nameText.text=listForEdit?.name
        self.moneyText.text=listForEdit?.money
        self.pictureView.image=listForEdit?.listAvatar
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier=="saveToList"{
            if(listForEdit==nil){
                listForEdit=list(name: "",money: "",listAvatar: nil)
            }
            listForEdit?.listAvatar=pictureView.image
            listForEdit?.name=nameText.text
            listForEdit?.money=moneyText.text
        }
       
    }
    

}
