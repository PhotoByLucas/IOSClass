//
//  textListTableViewController.swift
//  text
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 qhp. All rights reserved.
//

import UIKit

class textListTableViewController: UITableViewController {
    
    var textList: [text]=[text]( )
    func initTextList( ){
        textList.append(text(name:"Tom", number: "134891"))
        textList.append(text(name:"Joe", number: "291458"))
    }
    
    func saveTextFile( ){
        let success = NSKeyedArchiver.archiveRootObject(textList, toFile: text.ArchiveURL.path)
        if !success{print("Failed")}
    }
    
    func loadTextFile( ) -> [text]?{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: text.ArchiveURL.path)as? [text])
    }
    override func viewDidLoad( ) {
        super.viewDidLoad( )
        if let defaultTextList = loadTextFile()
        {
            textList = defaultTextList
            if (defaultTextList.count==0){
                initTextList()
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   

@IBAction func cancleTolist(segue: UIStoryboardSegue){
    
}
    @IBAction func saveToList(segue: UIStoryboardSegue){
        if let addTextVC = segue.source as? detailViewController{
            if let addText = addTextVC.textForEdit{
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    textList[(selectedIndexPath as NSIndexPath).row] = addText
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    textList.append(addText)
                    let newIndexPath = IndexPath(row: textList.count-1, section:0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
              saveTextFile()
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
        return textList.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textcell", for: indexPath)

        // Configure the cell...
       cell.textLabel?.text = textList[indexPath.row].name
        cell.detailTextLabel?.text = textList[indexPath.row].number
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
            textList.remove(at: indexPath.row)
            saveTextFile()
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
        let descriptionVC = segue.destination as! detailViewController
        if let selectedCell = sender  as? UITableViewCell{
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedText = textList[(indexPath as NSIndexPath).row]
            descriptionVC.textForEdit = selectedText
            
        }
    }
}

