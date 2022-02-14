//
//  dailyTask.swift
//  App360
//
//  Created by MD Abir Hosssain on 28/10/21.
//  Copyright © 2021 MD Abir Hosssain. All rights reserved.
//

import SwiftUI
import UIKit
import Combine


struct dailyTask: View {
    @ObservedObject var taskSore = TaskStore()
    var body: some View {
        NavigationView {
            VStack {
                
                List() {
                    
                    Text("Hello")
                    
                }
            }
        }
    }
}

struct dailyTask_Previews: PreviewProvider {
    static var previews: some View {
        dailyTask()
    }
}

