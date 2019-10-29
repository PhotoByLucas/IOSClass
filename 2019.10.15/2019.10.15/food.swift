//
//  food.swift
//  2019.10.15
//
//  Created by Lucas on 2019/10/15.
//  Copyright © 2019 Lucas. All rights reserved.
//

import Foundation
import UIKit
// 添加可串行化功能 从NS两个对象中继承k使得可以序列化
class food :NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name,forKey: "nameKey")
        aCoder.encode(foodDescription,forKey: "descriptionKey")
        aCoder.encode(foodCategory,forKey: "categoryKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name=aDecoder.decodeObject(forKey: "nameKey") as? String
        foodDescription=aDecoder.decodeObject(forKey: "descriptionKey") as? String
        foodCategory=aDecoder.decodeObject(forKey: "categoryKey") as? String
    }
    
    
    
    // 定义变量
    var name: String?
    var foodDescription: String?
    var foodCategory: String?
    var foodAvatar: UIImage?
    
    
    // 获取当前app目录
    static let DocumentDireactory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDireactory.appendingPathComponent("foodList")
    
    // 初始化函数
    init(name:String?,description:String?,foodCategory: String?,foodAvatar: UIImage?){
        self.name=name
        self.foodDescription=description
        self.foodCategory=foodCategory
        self.foodAvatar=foodAvatar
    }
    
    
}
