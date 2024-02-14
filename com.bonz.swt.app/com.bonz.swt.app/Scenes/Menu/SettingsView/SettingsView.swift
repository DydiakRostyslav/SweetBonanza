//
//  SettingsView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var checkSound: Bool = true
    @State var checkMusic: Bool = false
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    })
        {
            HStack {
                Image("iconBack")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            }
        }
    }
    
    var body: some View {
        
        ZStack {
            Image("menuBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Image("Group")

                VStack {
                    Text("Settings")
                        .padding(.bottom, 180)
                }
                
                HStack {
                    Toggle(isOn: $checkSound) {
                        Text("Sound")
                            .font(.custom("CherryBombOne-Regular", size: 40))
                            .padding(.trailing, 50)
                    }
                    .toggleStyle(CheckToggleStyle())
                    .padding(.bottom, 40)
                }
                
                HStack {
                    Toggle(isOn: $checkMusic) {
                        Text("Music")
                            .font(.custom("CherryBombOne-Regular", size: 40))
                            .padding(.trailing, 55)
                    }
                    .toggleStyle(CheckToggleStyle())
                    .padding(.top, 90)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Settings").font(.custom("CherryBombOne-Regular", size: 40))
                            .foregroundStyle(.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .font(.custom("CherryBombOne-Regular", size: 47))
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    SettingsView()
}
