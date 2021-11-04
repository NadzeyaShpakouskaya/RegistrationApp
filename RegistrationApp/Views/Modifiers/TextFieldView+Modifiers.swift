//
//  TextFieldView+Modifiers.swift
//  RegistrationApp
//
//  Created by Nadzeya Shpakouskaya on 04/11/2021.
//

import SwiftUI

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.indigo)
            )
            .shadow(color: Color.gray.opacity(0.4), radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func bordered() -> some View {
        ModifiedContent(
            content: self,
            modifier: BorderedViewModifier()
        )
    }
}
