//
//  RulesView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct RulesView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                Image("RectangleFon")
                    .cornerRadius(27)
                    .padding([.leading, .trailing], 16)
                
                VStack {
                    Text("Your goal is to position the game elements correctly. At the beginning of the game there will be a window with the location of the elements, you need to remember them and then place them accordingly. You earn points for each placed element. The game ends when the time is up, if everything is correct - you win, otherwise you lose.")
                        .padding(30)
                        .multilineTextAlignment(.center)
                    
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("About Us").font(.custom("CherryBombOne-Regular", size: 40))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .font(.custom("CherryBombOne-Regular", size: 27))
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    RulesView()
}
