//
//  WinOrLoseView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 14.02.2024.
//

import SwiftUI

struct WinOrLoseView: View {
    
    @State var countrPoint = 120
    
    var body: some View {
        NavigationStack {
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
                    
                    if countrPoint == 0 {
                        Image("LOSE")
                            .padding(.bottom, 180)
                    } else {
                        Image("WIN")
                            .padding(.bottom, 180)
                    }
                    
                    ZStack {
                        Image("CountePoint")
                        
                        Text(String(countrPoint))
                            .font(.custom("CherryBombOne-Regular", size: 40))
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 50)
                    
                    HStack {
                        NavigationLink(destination: MenuView()) {
                            Image("MenuBatton")
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        NavigationLink(destination: PlayView()) {
                            Image("RefreshButton")
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        if countrPoint == 0 {
                            NavigationLink(destination: PlayView()) {
                                Image("NextOnButton")
                                    .aspectRatio(contentMode: .fit)
                            }
                        } else {
                            Image("NextOffButton")
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .padding(.top, 300)
                }
            }
            .padding(.bottom, 50)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    WinOrLoseView()
}
