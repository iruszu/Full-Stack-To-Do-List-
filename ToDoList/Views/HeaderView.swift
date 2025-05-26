//
//  HeaderView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-04-01.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background.opacity(0.6))
                .rotationEffect(Angle(degrees: angle))
                .offset(y: -10)
                
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 40, weight: .bold, design: .default))
                Text(subtitle)
                . foregroundColor(Color.white)}.padding(.top, 80)
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)
    }
}

#Preview {
    HeaderView(
        title: "Title",
        subtitle: "Subtitle",
        angle: 15,
        background: .blue)
}
