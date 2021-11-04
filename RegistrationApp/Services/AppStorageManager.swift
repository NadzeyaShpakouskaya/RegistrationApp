//
//  AppStorageManager.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 04/11/2021.
//

import Combine
import SwiftUI


class AppStorageManager: ObservableObject {
    let objectWillChange = PassthroughSubject<AppStorageManager, Never>()
    
    @AppStorage("username") private var name: String = ""
    @AppStorage("isRegistered") private var isRegistered: Bool?
    
    
    func saveNewUserWith(_ name: String) {
        isRegistered = true
        self.name = name
        objectWillChange.send(self)
    }
    
    func removeUser() {
        isRegistered = nil
        name = ""
        objectWillChange.send(self)
    }
    
    func fetchUserName() -> String {
        return name
    }
    
    func isUserRegistered() -> Bool {
        return isRegistered ?? false
    }
}
