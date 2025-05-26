//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    
    init() {

    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
           dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false )
        
        // Save model as a collection of the current user
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) //converts above model to a dictionary we can write into a database
                
            }
    
    //checking conditions for saving new to-do
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { //subtracting how many seconds (86400) exist in a day, and make sure the due date is greater than or equal to yesterday to (edge case) 
            return false
        }

        return true
    }
    
}

// Observable object enables the view to be notified when data changes, and views that use @StateObject or
// @ObservedObject will update when @Published properties change
