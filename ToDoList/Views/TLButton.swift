//
//  TLButton.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-04-01.
//

import SwiftUI

struct TLButton: View {
    let background: Color
    let title: String
    let action: () -> Void
    
    
    var body: some View {
        Button {
            // Attempt Log In (within Form)
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(background: .pink, title: "Value", action: {})
} // passing in dummy values for our preview
