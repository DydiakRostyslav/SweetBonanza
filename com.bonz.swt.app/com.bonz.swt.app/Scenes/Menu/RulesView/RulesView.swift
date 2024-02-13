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
            
            VStack {
                Text("Rules View")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                Text("Rules").font(.custom("CherryBombOne-Regular", size: 40))
                                    .foregroundStyle(.white)
                            }
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
    RulesView()
}
