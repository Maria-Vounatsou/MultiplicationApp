//
//  Challenge_MultiplicationAppApp.swift
//  Challenge_MultiplicationApp
//
//  Created by Maria Vounatsou on 20/5/24.
//

import SwiftUI

@main
struct Challenge_MultiplicationAppApp: App {
    
    @StateObject var viewModel = GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20])
    
    var body: some Scene {
        WindowGroup {
            MainTabbedView()
                .environmentObject(GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20]))
        }
    }
}
