//
//  TodoViewModel.swift
//  BComX-1 Example Project
//
//  Created by Collins, Matthew - MC on 06/10/2023.
//

import Foundation

class TodoViewModel: ObservableObject {
    
    static let shared = TodoViewModel()
    let fileManager = FileManager.default
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let todosDirectoryURL: URL
    
    @Published var todos: [TodoItem] = []
    @Published var isSheetVisible: Bool = false
    @Published var newTodo: TodoItem = TodoItem(title: "")
    @Published var addTodoError: String?
    
    private init() {
        print("initialising directory")
        todosDirectoryURL = documentsURL.appendingPathComponent("todos")
        print(todosDirectoryURL)
        do {
            try fileManager.createDirectory(at: todosDirectoryURL, withIntermediateDirectories: true, attributes: nil)
            print("successfully created todos directory")
        }
        catch {
            print("Error creating directory: \(error.localizedDescription)")
        }
        
        loadTodos()
    }
    
    func toggleAddTodoSheet() {
        self.isSheetVisible.toggle()
    }
    
    func loadTodos() {
        print("loading todos")
        do {
            let todoFiles = try fileManager.contentsOfDirectory(at: todosDirectoryURL, includingPropertiesForKeys: nil, options: [])
            print("success getting todoFiles: \(todoFiles)")
            
            self.todos = todoFiles.compactMap { url in
                guard url.pathExtension == "json" else {
                    return nil
                }
                print("\(url)")
                do {
                    let data = try Data(contentsOf: url)
                    print(data)
                    return try JSONDecoder().decode(TodoItem.self, from: data)
                }
                catch {
                    return nil
                }
            }
            print("Got todos: \(self.todos)")
        }
        catch {
            print("Error loading todos: \(error)")
        }
    }
    
    func saveTodo(_ todo: TodoItem) {
        print("saving todo...")
        let todoURL = todosDirectoryURL.appendingPathComponent("\(todo.id.uuidString).json")
        print("success getting todo url: \(todoURL)")
        
        do {
            let data = try JSONEncoder().encode(todo)
            print("success encoding data: \(data)")
            
            try data.write(to: todoURL)
            print("success writing data")
        }
        catch {
            print("Error saving todo: \(error)")
        }
    }
    
    func addTodo() {
        print("adding todo")
        if self.newTodo.title.count != 0 {
            self.todos.append(self.newTodo)
            print(self.newTodo)
            self.saveTodo(self.newTodo)
            self.newTodo = TodoItem(title: "")
            self.toggleAddTodoSheet()
        }
        else {
            self.addTodoError = "Todo title must not be empty"
        }
    }
    
    func deleteTodo(_ todo: TodoItem) {
        if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
            do {
                let todoURL = todosDirectoryURL.appendingPathComponent("\(todo.id.uuidString).json")
                try fileManager.removeItem(at: todoURL)
            }
            catch {
                print("Error removing todo: \(error)")
            }
            self.todos.remove(at: index)
        }
    }
    
    func toggleTodoCompletion(todo: TodoItem) {
        if let index = self.todos.firstIndex(where: { $0.id == todo.id }) {
            print("attempting to toggle todo id: \(todos[index].id)")
            print("desired id: \(todo.id)")
            todos[index].isCompleted.toggle()
            saveTodo(self.todos[index])
        }
    }
}
