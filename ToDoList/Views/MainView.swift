//
//  ContentView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-30.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel() 
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView

            } else {
                LoginView()
            }
    }
    
    @ViewBuilder //abstracted function called accountView
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    MainView()
}
