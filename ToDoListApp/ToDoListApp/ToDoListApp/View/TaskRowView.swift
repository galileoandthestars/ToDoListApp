//
//  TaskRowView.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/4/24.
//
/**
 Item View
 Create a Custom Task Row View (TaskRowView):
    Design a SwiftUI view that represents a single task item.
    Include UI elements such as:
        A Text view to display the task title.
        An optional Image or Toggle to indicate task completion.
 */

import SwiftUI

struct TaskRowView: View {
    @Binding var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(task.isCompleted ? .blue : .gray)
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            Text(task.title)
                .font(.headline)
                .strikethrough(task.isCompleted)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: .constant(Task(title: "Sample Task", isCompleted: false)))  
    }
}

