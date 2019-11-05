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
//从NSObject继承，实现NSCoding接口

class food : NSObject, NSCoding
{
    var name: String?
    var foodDescription: String?
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(foodDescription, forKey: "descriptionKey")
      //  aCoder.encode(foodCategory,forKey: "categoryKey")
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        name=aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription=aDecoder.decodeObject(forKey: "descriptionKey") as? String
       // foodCategory=aDecoder.decodeObject(forKey: "categoryKey") as? String
    }
    
    
    
    //add document path
    static let DocumentsDirectory=FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL=DocumentsDirectory.appendingPathComponent("foodList")
    
    
    
    init(name: String?, foodDescription: String?)
    {
        self.name=name
        self.foodDescription=foodDescription
    }
}


 
