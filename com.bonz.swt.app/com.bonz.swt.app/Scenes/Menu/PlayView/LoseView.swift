//
//  LoseView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 14.02.2024.
//

import SwiftUI

struct LoseView: View {
    var body: some View {
        ZStack {
            Image("RememberBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Image("RectangleFon")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Image("Group")
            }
        }
    }
}

#Preview {
    LoseView()
}
