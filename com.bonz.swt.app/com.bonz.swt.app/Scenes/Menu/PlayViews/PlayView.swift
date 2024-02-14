//
//  PlayView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct PlayView: View {
    
    @State private var timeRemaining = 4
    @State private var isActiveTimer = true
    @State private var isTimerFinished = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                Image("Timer")
                    .edgesIgnoringSafeArea(.all)
                
                Text(timerText)
                    .font(.custom("CherryBombOne-Regular", size: 13))
                    .foregroundStyle(.white)
                    .padding(.leading, 22)
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
            .padding(.bottom, 700)

            VStack {
                Image("REMEMBER")
                    .padding(.bottom, 400)
            }
            .onDisappear {
                self.stopTimer()
            }
            .onAppear {
                self.resetTimer()
            }
            .background(
                NavigationLink(
                    destination: RememberView(),
                    isActive: $isTimerFinished,
                    label: { EmptyView() }
                )
                .hidden()
            )
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func onTimerFinished() {
        self.isTimerFinished = true
    }
    
    private func stopTimer() {
        self.isActiveTimer = false
    }
    
    private func resetTimer() {
        self.timeRemaining = 4
        self.isActiveTimer = true
        self.isTimerFinished = false
    }
    
    var timerText: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    PlayView()
}
