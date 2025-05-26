//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else{
            return
        }
        
        //once validated, create a user
        Auth.auth().createUser(withEmail: email, password: password) {[weak self]result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
        }
        
    }
    
    
    
    private func insertUserRecord(id: String){ //inserts user data into firebase
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970) // we can't directly save a date object into firebase so we use this (# of seconds since 1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) //what we expect to put into database
           
    }
    
    private func validate() -> Bool { //requirements for user registration
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        
        return true
        
    }
}
