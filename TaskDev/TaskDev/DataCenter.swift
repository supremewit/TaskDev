//
//  DataCenter.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 11..
//  Copyright © 2017년 Mac. All rights reserved.
//

import Foundation

let dataCenter:DataCenter = DataCenter()

class DataCenter {
    var features:[Feature] = []
    var tasks:[Task] = []
    
    init() {
        let TodoReadme = Todo(title: "Todo Read Me", done: true)
        
        var TaskReadme = Task(title: "Task Read Me", progress: 100)
        TaskReadme.TodoList = [TodoReadme]
        tasks += [TaskReadme]
        
        var FeatureReadme = Feature(title: "Feature Read Me")
        FeatureReadme.TaskList = [TaskReadme]
        features += [FeatureReadme]
    }
}

struct Feature {
    let title:String
    var deadLine:Date?
    var TaskList:[Task]?
    
    init(title:String) {
        self.title = title
    }
    
}

struct Task {
    let title:String
    var TodoList:[Todo]?
    var deadLine:Date?
    var progress:Int
    
    init(title:String, progress:Int) {
        self.title = title
        self.progress = progress
    }
}

struct Todo {
    let title:String
    var done:Bool = false
    
    init(title:String, done:Bool) {
        self.title = title
        self.done = done
    }
}


