//
//  LoginView.swift
//  Timer
//
//  Created by user on 15.05.2024.
//

import SwiftUI

struct LoginView: View {
   
    
    @EnvironmentObject private var userManager: UserManager //чтобы достать данные из окружения/ Это ссылка на объект в окружении в котором лежит экзепляр класса

    @AppStorage ("User") private var user = ""
 

    var isLoginButtonDisabled: Bool {
        characterCount(character: user)
    }


    var body: some View {

        VStack {
            
            HStack {
                TextField("Enter your name", text: $user)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 260)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text("\(counterLetters(in: user))")
                    .multilineTextAlignment(.center)
                    .frame(width: 52, height: 52)
                    .background(.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundStyle(isLoginButtonDisabled ? .red : .blue)
                    
            }
          
            
            ButtonLogIn(isDisable: isLoginButtonDisabled) {
                login()
            }
            .frame(width: 316, height: 52)
            .background(LinearGradient(colors: [.purple.opacity(0.4), .pink.opacity(0.4)], startPoint: .leading, endPoint: .trailing))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
        }
    }
    
    //считаем количество букв в строке ввода
    func counterLetters(in text: String) -> Int {
        return text.filter { $0.isLetter }.count
    }
    
    //возвращает тру если количество букв больше 2
    func characterCount(character: String) -> Bool {
        character.count < 2
    }
    
    
    private func login() {
        if !characterCount(character: user) {
            userManager.isLoggedIn.toggle()
            userManager.user.name = user
        }
        
    }
        
}


#Preview {
    LoginView()
}

struct ButtonLogIn: View {
    let isDisable: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("OK")
                
                .foregroundColor(isDisable ? .gray : .white)
                .bold()
                .disabled(isDisable)
        }
    }
}
