//
//  PlayView.swift
//  com.bonz.swt.app
//
//  Created by Rostyslav on 13.02.2024.
//

import SwiftUI

struct PlayView: View {
    @State private var timeRemaining = 2
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
                
                Image("REMEMBER")
                .padding(.bottom, 500)
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
    }
    
    private func onTimerFinished() {
        self.isTimerFinished = true
    }
    
    private func stopTimer() {
        self.isActiveTimer = false
    }
    
    private func resetTimer() {
        self.timeRemaining = 2
        self.isActiveTimer = true
        self.isTimerFinished = false
    }
}

#Preview {
    PlayView()
}
