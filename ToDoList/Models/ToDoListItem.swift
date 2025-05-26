//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//
///What the app does when someone adds an item

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool //var so we can mutate this
    
    mutating func setDone(_ state: Bool) {
        isDone = state
        
    }
}
