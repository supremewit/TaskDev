//
//  TaskListViewController.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 22..
//  Copyright © 2017년 Mac. All rights reserved.
//

import UIKit

class TaskListViewController: UITableViewController {

    @IBAction func unwindToTaskList(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func makeTask(task:Task) {
        if(dataCenter.task.append(task)) == nil {
            dataCenter.task = [task]
        }
        dataCenter.save()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = dataCenter.task.count
        return rowCount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let taskCell = dataCenter.task[indexPath.row]
        cell.textLabel?.text = taskCell.title
        let deadLine = taskCell.deadLine != nil ? "\(taskCell.deadLine!.description) 까지" : ""
        cell.detailTextLabel?.text = deadLine
        cell.detailTextLabel?.textColor = UIColor.gray
        return cell
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let saveAsTemplate = UITableViewRowAction(style: .normal, title: "save") { action, index in
            dataCenter.AddTaskToTemplates(index: indexPath.row)
        }
        let delete = UITableViewRowAction(style: .normal, title: "delete") { action, index in
            dataCenter.task.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            dataCenter.save()
        }
        delete.backgroundColor = UIColor.red
        return [saveAsTemplate, delete]
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Task" {
            if let destination = segue.destination as? TodoListViewController {
                if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                    destination.taskList = dataCenter.task[selectedIndex] as Task
                }
            }
        }
    }
    

}
