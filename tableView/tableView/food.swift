//
//  food.swift
//  tableView
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qcx. All rights reserved.
//


/*
class food
{
    
    
    var name: String?
    var description: String?
    
    init(name: String?,description: String?)
    {
        self.name=name
        self.description=description
    }
}*/


import Foundation
import UIKit
//从NSObject继承，实现NSCoding接口

class food : NSObject, NSCoding
{
    var name: String?
    var foodDescription: String?
    // foodCategory:Strubf?
    var foodAvatar : UIImage?
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey")
      //  aCoder.encode(foodCategory,forKey: "categoryKey")
        aCoder.encode(foodAvatar,forKey:"foodAvatarKey")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        name=aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription=aDecoder.decodeObject(forKey: "descriptionKey") as? String
       // foodCategory=aDecoder.decodeObject(forKey: "categoryKey") as? String
        foodAvatar=aDecoder.decodeObject(forKey: "foodAvatarKey") as? UIImage
    }
    
    
    
    //add document path
    static let DocumentsDirectory=FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL=DocumentsDirectory.appendingPathComponent("foodList")
    
    
    
    init(name: String?, foodDescription: String?,foodAvatar:UIImage?)
    {
        self.name=name
        self.foodDescription=foodDescription
        //self.foodCategory=foodCategory
        self.foodAvatar=foodAvatar
    }
}


 
