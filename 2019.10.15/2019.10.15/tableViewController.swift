//
//  TableViewController.swift
//  2019.10.15
//
//  Created by Lucas on 2019/10/15.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // 定义变量
    var foodList: [food] = [food]()
    
    // 初始化数组函数
    func initFoodList() {
        foodList.append(food(name:"hello1",description:"world1",foodCategory: "",foodAvatar: nil))
        foodList.append(food(name:"hello2",description:"world2",foodCategory: "",foodAvatar: nil))
        foodList.append(food(name: "a", description: "b",foodCategory: "",foodAvatar: nil))
    }

    // 保存数据
    func saveFoodFile() {
        let success = NSKeyedArchiver.archiveRootObject(foodList, toFile: food.ArchiveURL.path)
        if !success {
            print("save fail")
        }
        print("save success")
    }
    
    // 加载数据
//    func loadFoodFile() -> [food]? {
//        return (NSKeyedUnarchiver.unarchivedObject(withFile: food.ArchiveURL.path) as? [food])
//    }

    func loadFoodFile() -> [food]? {
        return(NSKeyedUnarchiver.unarchiveObject(withFile: food.ArchiveURL.path) as? [food])
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let defaultFoodList = loadFoodFile() {
            foodList=defaultFoodList
            
            // 当数组为空数组时，初始化数组
            if(defaultFoodList==[]){
                initFoodList()
            }
        }
        
        self.tableView.rowHeight=100
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodList", for: indexPath) as! TableViewCellController

        // 高度
        // Configure the cell...
        
        cell.imageViewOL?.image=foodList[indexPath.row].foodAvatar
        cell.labelOneOL?.text=foodList[indexPath.row].name
        cell.labelTwoOL?.text=foodList[indexPath.row].foodDescription
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            foodList.remove(at: indexPath.row)
            saveFoodFile()
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 将列表中的数据传给详情页
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let detailVC = segue.destination as! foodViewController
        if let selectedCell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedFood = foodList[(indexPath as NSIndexPath).row]
            // detailVC 为detail页面的view controller foodForEdit为数据
            detailVC.foodForEdit = selectedFood
        }
    }
    
    // 接受
    @IBAction func saveToList(segue:UIStoryboardSegue){
        // segue是跳转页面的中间控制器，有 source 和 destination 两个选项
        if let addFoodVC = segue.source as? foodViewController{
            if let addFood = addFoodVC.foodForEdit {
                print("outside", addFood.name)
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    foodList[(selectedIndexPath as NSIndexPath).row]=addFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    foodList.append(addFood)
                    let newIndexPath = IndexPath(row:foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        
        saveFoodFile()
    }
    
    // 回到列表列表的函数
    @IBAction func exitToTableViewController(segue:UIStoryboardSegue){
        print("exit to table view controller")
    }
}
