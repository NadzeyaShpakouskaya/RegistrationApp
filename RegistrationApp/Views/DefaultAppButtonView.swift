//
//  DefaultAppButtonView.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 04/11/2021.
//

import SwiftUI

struct DefaultAppButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button (action: action) {
            Text(title)
                .foregroundColor(.white)
                .font(.title)
                .bold()
        }
        .frame(width: 150, height: 50)
        .background(backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 5)
        )
        .shadow(color: .secondary, radius: 3)

    }
}

struct DefaultAppButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultAppButtonView(title: "Button", backgroundColor: .red, action: {})
    }
}
