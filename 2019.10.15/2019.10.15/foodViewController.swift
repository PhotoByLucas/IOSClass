//
//  foodViewController.swift
//  2019.10.15
//
//  Created by Lucas on 2019/10/15.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class foodViewController: UIViewController {
    
    // 定义一个接受列表页面传过来的参数
    var foodForEdit: food?

    override func viewDidLoad() {
        super.viewDidLoad()

        // 将传过来的属性值传给文本框
        input1.text = foodForEdit?.name
        input2.text = foodForEdit?.foodDescription
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UITextField!
    
    
//    @IBAction func input1DidEnd(_ sender: Any) {
////        print("input1",input1.text)
//
//    }
    
//    @IBAction func clickSave(_ sender: Any) {
//        //print(input1?.text)
//        foodForEdit?.name=input1.text
//        foodForEdit?.description=input2.text
//
//    }
    
    
    @IBOutlet weak var clickCancel: UINavigationItem!
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "saveToList" {
            // 新增的时候 需要初始化foodForEdit对象 否则该对象会为空
            if( foodForEdit == nil ){
                foodForEdit = food(name: "", description: "")
            }
            foodForEdit?.name=input1.text
            foodForEdit?.foodDescription=input2.text
        }
    }
    

}
