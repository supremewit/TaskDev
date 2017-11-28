//
//  DataCenter.swift
//  TaskDev
//
//  Created by Mac on 2017. 11. 22..
//  Copyright © 2017년 Mac. All rights reserved.
//

import Foundation

let dataCenter = DataCenter()
let taskName = "TaskNameKey"
let templateName = "TemplateNameKey"

class DataCenter {
    var task:[Task] = []
    var templates:[Template] = []
    
    var Taskfilepath:String {
        get {
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            return documentDirectory + "/" + taskName //저장할 파일경로 생성
        }}
    
    var Templatefilepath:String {
        get {
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            return documentDirectory + "/" + templateName
        }
    }
    
    func AddTaskToTemplates(index:Int) -> Void
    {
        let template = Template()
        template.task = task[index]
        templates.append(template)
        save()
    }
    
    init() {
        if FileManager.default.fileExists(atPath: self.Taskfilepath) {
            if let unarchTask = NSKeyedUnarchiver.unarchiveObject(withFile: self.Taskfilepath) as? [Task] {
                task += unarchTask
            }
        }
        if FileManager.default.fileExists(atPath: self.Templatefilepath) {
            if let unarchtemplate = NSKeyedUnarchiver.unarchiveObject(withFile: self.Templatefilepath) as? [Template] {
                templates += unarchtemplate
            }
        }
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.task, toFile: self.Taskfilepath)
        NSKeyedArchiver.archiveRootObject(self.templates, toFile: self.Templatefilepath)
    }
}

class Template:NSObject, NSCoding {
    var task:Task?
    let uploader:String
    
    override init() {
        self.uploader = "someone"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.task, forKey: "task")
        aCoder.encode(self.uploader, forKey: "uploader")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.task = aDecoder.decodeObject(forKey: "task") as? Task
        self.uploader = aDecoder.decodeObject(forKey: "uploader") as! String
    }
}

class Task:NSObject, NSCoding {
    var title:String
    let importance:String
    let deadlineSwitch:Bool
    var deadLine:String?
    var progress:Int
    var TodoList:[Todo]?
    
    override init() {
        self.title = "제목 없음"
        self.importance = "N"
        self.deadlineSwitch = false
        self.progress = 0
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.importance, forKey: "importance")
        aCoder.encode(self.deadlineSwitch, forKey: "deadlineSwitch")
        aCoder.encode(self.progress, forKey: "progress")
        aCoder.encode(self.deadLine, forKey: "deadLine")
        aCoder.encode(self.TodoList, forKey: "Todo")
    }
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.importance = aDecoder.decodeObject(forKey: "importance") as! String
        self.deadlineSwitch = aDecoder.decodeBool(forKey: "deadlineSwtich")
        self.progress = aDecoder.decodeInteger(forKey: "progress")
        self.deadLine = aDecoder.decodeObject(forKey: "deadLine") as? String
        self.TodoList = aDecoder.decodeObject(forKey: "Todo") as? Array
    }
}

class Todo:NSObject, NSCoding {
    var title:String
    let detailDescription:String
    
    override init() {
        self.title = "제목 없음"
        self.detailDescription = "-"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.detailDescription, forKey: "detailDescription")
    }
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.detailDescription = aDecoder.decodeObject(forKey: "detailDescription") as! String
    }
}
