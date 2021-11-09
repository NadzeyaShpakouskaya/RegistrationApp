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
    
    @AppStorage("user") private var userData: Data?
    
    func saveUser(user: User) {
        userData = try? JSONEncoder().encode(user)
        objectWillChange.send(self)
    }
    
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(
            User.self,
            from: userData ?? Data()
        ) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userData = nil
        objectWillChange.send(self)
    }
}
