//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.body)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123",
                                  title: "get milk", dueDate: Date().timeIntervalSince1970,
                                  createdDate: Date().timeIntervalSince1970,
                                  isDone: true))
}
