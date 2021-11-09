//
//  StartView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

struct StartView: View {

    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegistered {
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
            .environmentObject(UserManager())
    }
}
