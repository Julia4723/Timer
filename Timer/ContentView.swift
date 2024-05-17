//
//  ContentView.swift
//  Timer
//
//  Created by user on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    //только если класс подписан под протокол ObservableObject. нельзя создать более одного объекта этого типа данных. Единственный источник данных. Работает с объектами класса
    @State private var timer = TimeCounter()

    @EnvironmentObject private var userManager: UserManager
   // @AppStorage ("isLoggedIn") var isLoggedIn: Bool = true
    
    
    
    var body: some View {
        VStack {
            Text("Hi,\(userManager.user.name) ")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            
            ButtonView(timer: timer)
            
            Spacer()
            
            Button(action: userManager.logOut) {
                Text("LogOut")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 20))
            .overlay (
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
                
            )
        }
        
    }
}

#Preview {
    ContentView()
        .environmentObject(UserManager())
}



struct ButtonView: View {
    var timer: TimeCounter//для наблюдения за объектом который подписан на протокол ObservableObject и который передан из родительского представления
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay (
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
        
    }
}

