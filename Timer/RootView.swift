//
//  RootView.swift
//  Timer
//
//  Created by user on 15.05.2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var userManager = UserManager()
    
    
    var body: some View {
        Group {
            if userManager.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
            
        }
        .environmentObject(userManager)
    }
}

#Preview {
    RootView()
}
