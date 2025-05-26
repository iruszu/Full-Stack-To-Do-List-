//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

// Used to store data for password & email log-ins

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {

        guard validate() else {
            // if form is validated, skip this; if not, run else
            return  // Return basically means "stop" if validate() returns false
        }
        
        // Run Log-In Successful -> go to app
        Auth.auth().signIn(withEmail: email, password: password)

    }
    
    private func validate() -> Bool { // Private because it is used by login() which is not private
        
        // When the function is first called, the error message is empty
        // (re-evaluates the fields when changes r made & login is pressed)
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            // check whether the email and password strings are not empty after
            // trimming any leading or trailing whitespace characters
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email address."
            
            return false
        }
        
        return true
        
    }
}


