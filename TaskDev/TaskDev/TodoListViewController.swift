//
//  TodoListViewController.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 22..
//  Copyright © 2017년 Mac. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    @IBOutlet weak var addTodo: UIBarButtonItem!
    var taskList:Task?
    
    @IBAction func unwindToTodoList(segue:UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = taskList?.title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func makeTodo(todo: Todo) {
        if(self.taskList?.TodoList?.append(todo)) == nil {
            self.taskList?.TodoList = [todo]
        }
        dataCenter.save()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowCount = taskList?.TodoList?.count else {
            return 0
        }
        return rowCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        guard let todoCell = taskList?.TodoList?[indexPath.row] else {
            return cell
        }
        cell.textLabel?.text = todoCell.title
        return cell
    }
/*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
*/

}
