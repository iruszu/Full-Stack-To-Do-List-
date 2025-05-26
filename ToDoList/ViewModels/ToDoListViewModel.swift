//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import Foundation

class ToDoListViewModel: ObservableObject {
    // View model for the entire to-do list, primary tab
    @Published var showingNewItemView: Bool = false
    
    init() {

    }
}

// Observable object enables the view to be notified when data changes, and views that use @StateObject or
// @ObservedObject will update when @Published properties change
