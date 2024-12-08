//
//  TaskViewModel.swift
//  ToDoListApp
//
//  Created by Fabiola Fonseca Rivera on 12/4/24.
//

 

import SwiftUI

//main layout
class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    private let tasksKey = "tasks_key"

    init() {
        loadTasks()
    }

    // Add a new note
    func addTask(title: String) {
        let newTask = Task(title: title, isCompleted: false)
        tasks.append(newTask)
        saveTasks()
    }

    // Delete task at specified offsets
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    // Update an existing task
    func updateTask(task: Task, title: String, isCompleted:Bool) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = title
            tasks[index].isCompleted = isCompleted
            saveTasks()
        }
    }


    // Save tasks to UserDefaults
    private func saveTasks() {
        do {
            let encodedData = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        } catch {
            print("Error encoding tasks: \(error)")
        }
    }

    // Load tasks from UserDefaults
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey) {
            do {
                tasks = try JSONDecoder().decode([Task].self, from: savedData)
            } catch {
                print("Error decoding notes: \(error)")
                tasks = []
            }
        }
    }
}


