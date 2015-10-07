//
//  SecondViewController.swift
//  To Do List
//
//  Created by Lisa Swanson on 10/5/15.
//  Copyright © 2015 LisaDeeSwanson. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController {
    
    @IBAction func addTodoItem(sender: AnyObject) {
        
        todoList.append(itemToAdd.text!)
        itemToAdd.text = ""
        NSUserDefaults.standardUserDefaults().setObject(todoList, forKey: "todoList")
    }

    @IBOutlet weak var itemToAdd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemToAdd.resignFirstResponder()
        return true

    }
}

