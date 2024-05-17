//
//  TimeCounter.swift
//  Timer
//
//  Created by user on 15.05.2024.
//

import Foundation
import Observation

@Observable
final class TimeCounter {
    //let objectWillChange = ObservableObjectPublisher()
    var counter = 3
    var buttonTitle = "Start"
    
    
    var timer: Timer?
    
    
    //таймер
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
            
            
        }
        buttonDidTapped()
       
    }
    
    
    //каждую секунду будет вызываться этот метод
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        //objectWillChange.send()//отправляет обновленное состояние всего класса
    }
    
    private func killTimer() {
        timer?.invalidate()//завершает работу таймера
        timer = nil
    }
    
    private func buttonDidTapped() {
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        
        //objectWillChange.send()//отправляем сообщение что состояние класса было изменено
    }
}
