//
//  ListTableViewController.swift
//  homework4
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var List: [list] = [list]()
    func initList(){
        //loadListFile()
        List.append(list(name:"cake",money: "1.2",listAvatar: nil))
        List.append(list(name:"apple",money: "1.6",listAvatar: nil))
    }
    func saveListFile(){
        let success = NSKeyedArchiver.archiveRootObject(List, toFile: list.ArchiveURL.path)
        if !success{
            print("Failed...")
        }
    }
    func loadListFile()->[list]?{
        //return (NSKeyedUnarchiver.unarchivedObject(withFile: list.ArchiveURL.path) as? [list])
        return (NSKeyedUnarchiver.unarchiveObject(withFile: list.ArchiveURL.path) as? [list])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let defaultList = loadListFile(){
            List = defaultList
            if(defaultList.count==0){
                initList()
            }
        }
        self.tableView.rowHeight=80
        //initList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func cancelToList(segue: UIStoryboardSegue){
        
    }
    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let addListVC=segue.source as? detailViewController{
            if let addList=addListVC.listForEdit{
                if let selectedIndexPath=tableView.indexPathForSelectedRow{
                    List[(selectedIndexPath as NSIndexPath).row] = addList
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    List.append(addList)
                    let newIndexPath=IndexPath(row: List.count-1,section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                 saveListFile()
            }
        }
       
    }
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return List.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        cell.nameText?.text=List[indexPath.row].name
        cell.moneyText?.text = List[indexPath.row].money
        cell.listAvatar?.image = List[indexPath.row].listAvatar
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
            // Delete the row from the data source
            List.remove(at: indexPath.row)
            saveListFile()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
//        if(segue.identifier == "showDetail"){
//            let descriptionVC=segue.destination as! detailViewController
//            if let selectedCell=sender as? UITableViewCell{
//                let indexPath=tableView.indexPath(for: selectedCell)!
//                let selectedList = List[(indexPath as NSIndexPath).row]
//                descriptionVC.listForEdit = selectedList
//            }
//        }
        let monryVC = segue.destination as! detailViewController
        if let selectedCell = sender as? TableViewCell{
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedList=List[(indexPath as NSIndexPath).row]
            monryVC.listForEdit=selectedList
        }
    }
    

}
