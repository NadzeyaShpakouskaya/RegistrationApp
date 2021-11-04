//
//  TimeCounter.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject {

    var counter: Int
    var counterState = CounterState.start
    
    let objectWillChange = PassthroughSubject<TimeCounter, Never>()

    private var timer: Timer?
    private var duration: Int // to reset timer value

    init(duration time: Int = 3) {
        self.counter = time
        self.duration = time
    }

    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(updateTimer),
                userInfo: nil,
                repeats: true)
        }
        buttonDidTapped()
    }

    @objc private func updateTimer() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            counterState = .end
        }

        objectWillChange.send(self)
    }

    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func buttonDidTapped() {
        if counterState == .end {
            counter = duration
            counterState = .start
        } else {
            counterState = .process
        }
        objectWillChange.send(self)
    }

}

enum CounterState: String {
    case start = "Start"
    case process = "Wait..."
    case end = "Reset"
}
