//
//  RegistrationView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

struct RegistrationView: View {

//    @State private var enteredName = ""
//
    @EnvironmentObject private var appStorageManager: AppStorageManager
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack (spacing: 32) {
            titleView
            inputView
            confirmButtonView
        }.padding()
    }

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(UserManager())
    }
}


// MARK: - SubViews
extension RegistrationView {
    
    private var titleView: some View {
        Text("Let's begin...")
            .foregroundColor(.indigo)
            .font(.largeTitle)
    }
    
    private var inputView: some View {
        HStack(spacing: 16) {
            TextField("Enter your name", text: $userManager.user.name)
                .bordered()
                .multilineTextAlignment(.center)
                .foregroundColor(.indigo)
        
            Text("\(userManager.user.name.count)")
                .foregroundColor(userManager.nameIsValid ? .green : .red)
        }
        .font(.title2)
        .padding()
    }
    
    private var confirmButtonView: some View {
        Button(action: {
            registerUser()
        }) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("OK").bold()
            }.font(.title2)
                .foregroundColor(userManager.nameIsValid ? .indigo : .secondary)
        }
        .disabled(!userManager.nameIsValid)
    }
}


// MARK: - Private Methods
extension RegistrationView {
    
   private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            appStorageManager.saveUser(user: userManager.user)
        }
    }
    
}
