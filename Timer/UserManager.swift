//
//  UserManager.swift
//  Timer
//
//  Created by user on 15.05.2024.
//


import Foundation


final class UserManager: ObservableObject {
    @Published var user = User()

    @Published var isLoggedIn = false //по умолчанию пользователь не залогинен, нажимаем ОК должны будем поменять значение свойства на true. здесь надо следить только за значением одного конкретного свойства.Поэтому используется обертка Published. Служит для автоматической генерации уведомлений об изменениях свойств объектов. Всякий раз когда свойство Published будет принимать новое значение все представления следящие за ним перерендарятся и примут новое значение
    
    func characterCount(character: String) -> Bool {
        character.count < 2
    }

    
    func logOut() {
        user.name = ""
        isLoggedIn.toggle()
    }
    
}
