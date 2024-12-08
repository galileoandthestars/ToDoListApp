//
//  TaskDetailView.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/4/24.
//

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    @ObservedObject var viewModel: TaskViewModel
    @Environment(\.dismiss) var dismiss

    @State private var isEditing: Bool = false
    @State private var editedTitle: String = ""
    @State private var isCompletedToggled: Bool = false
    @State private var showingDeleteAlert: Bool = false
    @State private var showingSuccessMessage: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if isEditing {
                TextField("Title", text: $editedTitle)
                    .font(.subheadline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

            } else {
                Text(task.title)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            if task.isCompleted {
                Text("Status: Completed")
                    .font(.callout)
                    .foregroundColor(Color.blue)
                    .padding(.top, 10)
            }
            
            if showingSuccessMessage{
                Text("Task updated successfully")
                    .font(.callout)
                    .foregroundColor(Color.green)
                    .transition(.opacity)
                    .padding(.top, 20)
            }

            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle("Task Details")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if isEditing {
                    Button("Save") {
                        let trimmedTitle = editedTitle.trimmingCharacters(in: .whitespaces)
                        if !trimmedTitle.isEmpty {
                            viewModel.updateTask(task: task, title: trimmedTitle, isCompleted: task.isCompleted)
                            isEditing = false
                        }
                        showSuccess()
                    }
                    .disabled(editedTitle.trimmingCharacters(in: .whitespaces).isEmpty)

                    Button("Cancel") {
                        isEditing = false
                    }
                } else {
                    Button("Edit") {
                        editedTitle = task.title
                        isCompletedToggled = task.isCompleted
                        isEditing = true
                    }

                    Button(action: {
                        showingDeleteAlert = true
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .alert(isPresented: $showingDeleteAlert) {
            Alert(
                title: Text("Delete Note"),
                message: Text("Are you sure you want to delete this note?"),
                primaryButton: .destructive(Text("Delete")) {
                    if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
                        viewModel.deleteTask(at: IndexSet(integer: index))
                        dismiss()
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
    
    private func showSuccess(){
        withAnimation{
            showingSuccessMessage = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation{
                showingSuccessMessage = false
            }
        }
    }
}

struct TaskDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetailView(task: Task(title: "Sample Task", isCompleted: false), viewModel: TaskViewModel())
    }
}
