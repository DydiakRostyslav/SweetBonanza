//
//  CheckToggleStyle.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 14.02.2024.
//

import SwiftUI

struct CheckToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Button {
                configuration.isOn.toggle()
            } label: {
                Image(configuration.isOn ? "ToggleOn" : "ToggleOff")
            }
        }
    }
}
