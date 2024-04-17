//
//  TodoModel.swift
//  TabViewExample
//
//  Created by Antriksh Singh on 16/04/24.
//

import Foundation

struct TodoModel{
    var title:String
    var isCompleted:Bool
    var priority: Priority
}

enum Priority{
    case high,medium,low
}
