//
//  TodoAddViewController.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 22..
//  Copyright © 2017년 Mac. All rights reserved.
//

import UIKit

class TodoAddViewController: UITableViewController {

    @IBOutlet weak var TodoTitle: UITextField!
    @IBOutlet weak var TodoDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.TodoTitle.becomeFirstResponder()
    }
    
    func newTodo() -> Todo {
        let todo:Todo = Todo()
        let title = TodoTitle.text!
        
        todo.title = title
        return todo
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TodoDone" {
            let todo = newTodo()
            guard let todoLVC = segue.destination as? TodoListViewController else {
                return
            }
            return todoLVC.makeTodo(todo: todo)
        }
    }
    

}
