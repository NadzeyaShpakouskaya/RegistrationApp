//
//  StartView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

struct StartView: View {
    @EnvironmentObject private var appStorageManager: AppStorageManager
    
    var body: some View {
        Group {
            if appStorageManager.isUserRegistered() {
                MainView()
            } else {
                RegistrationView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(AppStorageManager())
    }
}
