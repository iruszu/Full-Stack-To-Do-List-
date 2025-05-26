//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Kellie Ho on 2025-03-31.
//
import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel() //connects logic from viewmodel to view, like data management
    @FirestoreQuery var items: [ToDoListItem] //query continuously listens for items
    
    init(userId: String) {
        //users exist in: users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        ) //underscore is a convention for property wrappers
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) {
                    item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                
                            }
                        }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("To-Do List")
                .toolbar {
                    Button {
                        //Action
                        viewModel.showingNewItemView = true
                    }
                    label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented:
                                    $viewModel.showingNewItemView)
                }
        }
    }
}

#Preview {
    ToDoListView(userId: "VJwO3yrikTRfA2IkZ6k4lnCopSI2")
}
