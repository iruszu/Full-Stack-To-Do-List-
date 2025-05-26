//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = "" //we want to observe from firebase when the user changes using handler
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() { //weak self to not cause a retained cycle weakened memory
        self.handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in // whenever the user signs in or signs out, the @published will be triggered and update our view
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        } //self? (self-optional) to not cause a memory leak)
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil // nil means theres a value for the current user. if != nil, it means we're not signed in
    }
}
