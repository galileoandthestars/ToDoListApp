# ToDoListApp
## Project Description: 
This iOS application is a To-do list app where users can keep trakc of a list of tasks. The implementation is done using the MVVM architecture and SwiftUI. 

## Screenshots:
### TaskListView
<img width="332" alt="Screenshot 2024-12-08 at 2 00 41 PM" src="https://github.com/user-attachments/assets/c194fa85-5d25-466e-8d7e-f9b0b33e137b">

### AddTaskView
<img width="367" alt="Screenshot 2024-12-08 at 2 01 09 PM" src="https://github.com/user-attachments/assets/f60ce22d-eeba-4166-815e-42bfb2d30b87">

### TaskDetailView
<img width="355" alt="Screenshot 2024-12-08 at 2 05 42 PM" src="https://github.com/user-attachments/assets/df94fba1-dbd0-443f-832c-523895e31164">

### ProfileView
<img width="354" alt="Screenshot 2024-12-08 at 2 06 15 PM" src="https://github.com/user-attachments/assets/6c10d918-be18-426f-ba84-c1d5ac1278aa">

## Usage Instructions: 
To run this application:
1. Clone project from this repository.
2. Open project in XCode.
3. Run application in XCode.

## Features Implemented: 
- Add Tasks: The user can add new tasks to the list, by clicking the "+" button in the main screen. This will open the AddTaskView, for the User to enter the new task's title and save it. 
- View Task List: The user can view the list of tasks. Also, the user can view the task's completion status. This is included in the main view.
- Edit Tasks: The user can edit and save the task's title in the TaskDetailView. 
- View Task Details: The user can view the task's details such as the title and the completion status.
- Mark and Unmark Task's Completion: In the main view, the user can mark or unmark a task. When marked as complete, the task's titled appears with a strikethrough.
- Delete Tasks: User can delete tasks in the TaskDetailView.
- View Profile: User can view the profile's information when clicking the "user" icon on the main view.
- Edit Profile Information: User can update profile information (name and e-mail) by clicking on the "user" icon on the main view. 
- Update and delete alerts: Receive update and deletion alerts when the user engages in those actions for the profile and task features.

## Challenges and Solutions: 
### Challenges
- Implementing the checkmark functionality
  Initially, the checkmark functionality was challenging to implement due to the immutability of the isCompleted attribute of the Task structure. After researching, I learned that utilizing the <Binding> keyword would be enable the two-way connection between the atribute and the view that displays and updates its changes.
  
- Understanding differences between State, StateObject and EnvironmentObject: The concepts confused me at first. After reading a few articles and watching videos, I learned how to apply them correctly. 
  
## Future Enhancements: 
- User Interface aesthetic can be improved.
- Include dark mode
- Include more details for the tasks
- Include time constraints for tasks and alarms
  

## Reflection: 
This was my first time implementing a functional application, and I can say that it was a fun experience. This lab provided me with a hands-on opportunity to dive into the MVVM pattern, which resulted in cleaner code. This architecture proved to be excellent for the separation of concerns. It was also a simpler and more intuitive way to code the application. Thanks to this, I was able to understand better the flow of data between the user interface and the business logic. For me, the most challenging part of this lab was implementing proper data binding between the View and the ViewModel. While SwiftUI's @State and @Published properties simplified reactive updates, managing state changes without introducing unnecessary re-renders required forethought. Additionally, enabling complex features, like persistent data storage tested my ability to integrate User Defaults with the MVVM pattern. Said process also introduced me to strategies to handle edge cases, such as empty states or invalid user input. This lab has prepared me for more advanced iOS development tasks by strengthening my understanding of SwiftUI development, state management, and architectural best practices. I feel more confident in handling larger projects that require scalability and maintainability thanks to these tools. I'm better equipped to approach challenges like implementing advanced user interactions. 
