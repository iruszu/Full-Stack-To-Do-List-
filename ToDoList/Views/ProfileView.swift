//
//  ProfileView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel() //connects logic from viewmodel to view, like data management
    
    var body: some View {
        VStack{
            NavigationView{
                Text("test")
            }.navigationTitle(Text("Profile"))
        }
    }
}

#Preview {
    ProfileView()
}
