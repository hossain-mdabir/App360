//
//  dailyTaskDataStorage.swift
//  App360
//
//  Created by MD Abir Hosssain on 18/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    
    var id = String()
    var taskItem = String()
    
}

class TaskStore : ObservableObject {
    
    @Published var tasks = [Task]()
    
}
