//
//  FirstViewController.swift
//  To Do List
//
//  Created by Lisa Swanson on 10/5/15.
//  Copyright © 2015 LisaDeeSwanson. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var todoListTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil) {
        todoList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as! [String]
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
        return todoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = todoList[indexPath.row]
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        todoListTable.reloadData()
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            todoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
            
            todoListTable.reloadData()
            
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
}

