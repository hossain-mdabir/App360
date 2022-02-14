//
//  dailyTask.swift
//  App360
//
//  Created by MD Abir Hosssain on 17/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import SwiftUI

struct dailyTask: View {
    @ObservedObject  var taskStore = TaskStore()
    @State var newTask : String = ""
    
    var searchBar : some View {
        
        HStack {
            
            TextField("Enter new task", text: self.$newTask)
            Button(action: self.addNewTask, label: { Text("New")
            })
        }
        
    }
    
    func addNewTask() {
        
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), taskItem: newTask))
        self.newTask = ""
        
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                searchBar.padding()
                
                List {
                     
                    ForEach(self.taskStore.tasks) {
                        
                        task in Text(task.taskItem)
                    
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }
            
                .navigationBarTitle("Daily Task")
                .navigationBarItems(trailing: EditButton())
                
            }
            
        }
        
    }
    
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        
    }
    
    func delete(at offsets : IndexSet) {
        
        taskStore.tasks.remove(atOffsets: offsets)
        
    }
}


struct dailyTask_Previews: PreviewProvider {
    static var previews: some View {
        dailyTask()
    }
}

