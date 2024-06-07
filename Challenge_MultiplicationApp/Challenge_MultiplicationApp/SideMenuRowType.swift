//
//  SideMenuRowType.swift
//  Challenge_MultiplicationApp
//
//  Created by Vounatsou, Maria on 5/6/24.
//

import SwiftUI

enum SideMenuRowType: Int, CaseIterable {
    case home = 0
    case settings
    case game
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .settings:
            return "Settings"
        case .game:
            return "Game"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "home"
        case .settings:
            return "gear"
        case .game:
            return "game"
        }
    }
}

