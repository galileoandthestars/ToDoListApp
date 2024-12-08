//
//  TaskListView.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/4/24.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    @State private var showingAddTask = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($viewModel.tasks) { $task in
                        NavigationLink(destination: TaskDetailView(task: task, viewModel: viewModel)) {
                            TaskRowView(task: $task)
                        }
                    }
                    // .onDelete(perform: viewModel.deleteTask)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddTask = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack{
                            NavigationLink(destination: ProfileView(viewModel: profileViewModel)){
                                Image(systemName: "person")
                                    .font(.title2)
                            }
                            Text("Hi, \(profileViewModel.profile.name)")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                    }
                }.padding(.top, 10)
                
                .sheet(isPresented: $showingAddTask) {
                    AddTaskView(viewModel: viewModel, isPresented: $showingAddTask)
                }
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 50)
        }
    }
    
    struct TaskListView_Previews: PreviewProvider {
        static var previews: some View {
            TaskListView()
        }
    }
    

