//
//  AboutUsView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct AboutUsView: View {
    
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
                    Text("")
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
    AboutUsView()
}
