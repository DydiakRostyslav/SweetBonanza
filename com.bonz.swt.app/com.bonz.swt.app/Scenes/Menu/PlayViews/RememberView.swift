//
//  RememberView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 14.02.2024.
//

import SwiftUI

struct RememberView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var timeRemaining = 7
    @State private var isActiveTimer = true
    @State private var isTimerFinished = false
    
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
                .edgesIgnoringSafeArea(.all)
            
            Image("RememberGameBG")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Image("LightBG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Timer: \(timeRemaining)")
                    .font(.largeTitle)
                    .padding(.bottom, 100)
                    .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                        guard self.isActiveTimer else { return }
                        
                        if self.timeRemaining > 0 {
                            self.timeRemaining -= 1
                        }
                        
                        if self.timeRemaining == 0 && !self.isTimerFinished {
                            self.isActiveTimer = false
                            self.onTimerFinished()
                        }
                    }
            }
            .onDisappear {
                self.stopTimer()
            }
            .onAppear {
                self.resetTimer()
            }
            .background(
                NavigationLink(
                    destination: WinOrLoseView(),
                    isActive: $isTimerFinished,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
    
    private func onTimerFinished() {
        self.isTimerFinished = true
    }
    
    private func stopTimer() {
        self.isActiveTimer = false
    }
    
    private func resetTimer() {
        self.timeRemaining = 7
        self.isActiveTimer = true
        self.isTimerFinished = false
    }
}

#Preview {
    RememberView()
}
