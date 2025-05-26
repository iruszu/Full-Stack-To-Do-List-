//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-30.
//
import FirebaseCore
import SwiftUI

@main

struct ToDoListApp: App {
    init() { FirebaseApp.configure() /// allows for the app to configure with our GoogleService-Info during crashes. This setup ensures Firebase services (like Firestore, Authentication, or Analytics) are ready to use when the app launches.
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
