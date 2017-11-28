//
//  TaskAddViewController.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 22..
//  Copyright © 2017년 Mac. All rights reserved.
//

import UIKit

class TaskAddViewController: UITableViewController {

    @IBOutlet weak var TaskTitle: UITextField!
    @IBOutlet weak var TaskImportance: UISegmentedControl!
    @IBOutlet weak var TaskDeadline: UIDatePicker!
    @IBOutlet weak var DeadlineSwitch: UISwitch!
    
    @IBAction func swithDeadline(_ sender: UISwitch) {
        self.TaskDeadline.isHidden = !self.TaskDeadline.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.TaskTitle.becomeFirstResponder()
    }
    
    func newTask() -> Task? {
        if TaskTitle.text == nil {
            return nil
        }
        let task:Task = Task()
        let title = TaskTitle.text!
        let deadline = TaskDeadline.date.description
        
        task.title = title
        task.deadLine = deadline
        
        return task
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskDone" {
            let task = newTask()
            guard let TaskLVC = segue.destination as? TaskListViewController else {
                return
            }
            return TaskLVC.makeTask(task: task!)
        }
    }
}
