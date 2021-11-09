//
//  RegistrationAppApp.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

@main
struct RegistrationAppApp: App {
    
    @StateObject private var appStorageManager = AppStorageManager()
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(appStorageManager)
                .environmentObject(UserManager(user: appStorageManager.loadUser()))
        }
    }
}
