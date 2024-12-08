//
//  AddTaskView.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/4/24.
//

/**
 Use a Form or VStack for the layout.
 Include:
 A TextField for entering the task title.
 Optional fields for additional task details.
 Save and Cancel buttons in the navigation bar or as part of the form.
 Input Validation:

 Ensure that the task title is not empty before allowing it to be saved.
 Provide user feedback if validation fails.
 */
import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @Binding var isPresented: Bool

    @State private var title: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Title")) {
                    TextField("Enter title", text: $title)
                }
            }
            .navigationTitle("Add New Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                        if !trimmedTitle.isEmpty {
                            viewModel.addTask(title: trimmedTitle)
                            isPresented = false
                        }
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(viewModel: TaskViewModel(), isPresented: .constant(true))
    }
}
