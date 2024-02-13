//
//  ContentView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("menuBG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    NavigationLink(destination: PlayView()) {
                        Image("buttonPlay")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 274, height: 92)
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        Image("buttonSetting")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 274, height: 92)
                    }
                    
                    NavigationLink(destination: RulesView()) {
                        Image("buttonRules")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 274, height: 92)
                    }
                    
                    NavigationLink(destination: AboutUsView()) {
                        Image("buttonAboutUs")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 274, height: 92)
                    }
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
