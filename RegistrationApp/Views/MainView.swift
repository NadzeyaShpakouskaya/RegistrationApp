//
//  MainView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 03/11/2021.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var appStorageManager: AppStorageManager
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            
            VStack(spacing: 50) {
                greetingView
                timerView
                DefaultAppButtonView(
                    title: "Log out",
                    backgroundColor: .red){
                        appStorageManager.clear(userManager: userManager)
                    }
            }
            .padding(EdgeInsets(top: 50, leading: 16, bottom: 50, trailing: 16))
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStorageManager())
    }
}

// MARK: - SubViews
extension MainView {
    
    private var timerView: some View {
        ZStack{
            Color.indigo
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 5)
                )
            
            VStack (spacing: 16) {
                Image(systemName: "deskclock.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                HStack (spacing: 16){
                    Text("Timer: ")
                        .fontWeight(.semibold)
                    Text("\(timer.counter)")
                        .fontWeight(.semibold)
                        .frame(width: 25)
                }
                .font(.title)
                
                DefaultAppButtonView(
                    title: timer.counterState.rawValue,
                    backgroundColor: .green) {
                        timer.startTimer()
                    }
            }.padding()
                .foregroundColor(.white)
            
        }
    }
    
    private var greetingView: some View {
        Text("Welcome, \(userManager.user.name)!")
            .bold()
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
