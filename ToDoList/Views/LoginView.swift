//
//  LoginView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//
import SwiftUI

struct LoginView: View {
@StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                //Abstracted out HeaderView
                HeaderView(
                    title: "To-Do List",
                    subtitle: "get things done.",
                    angle: 15,
                    background: .blue).offset(y: 25)
                
                
                
                //login form
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text("ERRORRR")
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .listRowSeparator(.hidden)
                        .padding(.top, 15)
                    SecureField("Password",
                                text:$viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .listRowSeparator(.hidden)
                    
                    TLButton(background: .blue, title: "Log In") {//attempt login
                        viewModel.login()
                    }
                    
                }
                    
                    VStack{
                        Text("New around here?")
                        
                        NavigationLink("Create an account", destination: RegisterView())
                            .padding(.bottom, 50)
                    }.padding()
                    
                    Spacer()
                    
                }
            }
        }
    }

#Preview {
    LoginView()
}
