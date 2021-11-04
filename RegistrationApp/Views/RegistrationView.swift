//
//  RegistrationView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

struct RegistrationView: View {

    @State private var enteredName = ""
    
    @EnvironmentObject private var appStorageManager: AppStorageManager
    
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
            .environmentObject(AppStorageManager())
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
            TextField("Enter your name", text: $enteredName)
                .bordered()
                .multilineTextAlignment(.center)
                .foregroundColor(.indigo)
        
            Text("\(enteredName.count)")
                .foregroundColor(isUsernameInputValid() ? .green : .red)
        }
        .font(.title2)
        .padding()
    }
    
    private var confirmButtonView: some View {
        Button(action: {
            appStorageManager.saveNewUserAs(enteredName)
        }) {
            HStack {
                Image(systemName: "checkmark.circle")
                Text("OK").bold()
            }.font(.title2)
                .foregroundColor(isUsernameInputValid() ? .indigo : .secondary)
        }
        .disabled(!isUsernameInputValid())        
    }
}


// MARK: - Private Methods
extension RegistrationView {
    
    private func isUsernameInputValid() -> Bool {
        return enteredName.count > 2
    }
    
}
