//
//  User.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
// What the app does when someone signs up

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

//convert anything that is codable into a dictionary, @ Extensions
