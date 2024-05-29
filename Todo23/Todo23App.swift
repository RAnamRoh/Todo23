//
//  Todo23App.swift
//  Todo23
//
//  Created by BS00834 on 29/5/24.
//

import SwiftUI

@main
struct Todo23App: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
