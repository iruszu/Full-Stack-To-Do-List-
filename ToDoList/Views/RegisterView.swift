//
//  RegisterView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {HeaderView(
            title: "Register",
            subtitle: "start organizing today.",
            angle: 15,
            background: .blue)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .listRowSeparator(.hidden)
                    .padding(.top, 15)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                TextField("Email Address", text:$viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .listRowSeparator(.hidden)
                    .padding(.top, -5)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .listRowSeparator(.hidden)
                    .padding(.top, -5)
                
                TLButton(background: .green,
                    title: "Create Account"
                         ) {
                    //attempt regitration (action argument)
                    viewModel.register()
                }.listRowSeparator(.hidden).padding(.top, -10)
                
            }
        }
        Spacer()
    }
    
}

#Preview {
    RegisterView()
}
