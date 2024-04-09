//
//  CardsOnboardingScreen.swift
//
//
//  Created by Asir Bygud on 2024-04-03.
//

import SwiftUI

struct CardsOnboardingScreen: View {
    @State private var animations: [Bool] = [false, false, false, false, false]
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .teal, .purple]
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<5) { index in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 150, height: 200)
                        .foregroundStyle(.ultraThinMaterial)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 200)
                                .foregroundStyle(colors[index].opacity(0.5))
                        }
                        .scaleEffect(1 - 0.06 * Double(index))
                        .rotation3DEffect(
                            .degrees(Double(animations[Int(index)] ? 30 * index : 10 * index)),
                            axis: (x: 0.1 * CGFloat(index), y: 0.1 * CGFloat(index), z: -0.2 * CGFloat(index)),
                            anchor: .bottomTrailing,
                            perspective: 0
                        )
                        .offset(x: animations[Int(index)] ? -100 : -10 * Double(index), y: animations[Int(index)] ? 500 : 15 * Double(index))
                        .zIndex(5 - Double(index))
                }
            }
            .rotationEffect(.degrees(animations[0] ? -30 : 0), anchor: .init(x: 1.5, y: 1.5))
            
            Button("Trigger!") {
                Task {
                    for number in 0..<5 {
                        withAnimation(.bouncy) {
                            animations[number].toggle()
                        }
                        try await Task.sleep(nanoseconds: 0_050_000_000)
                    }
                }
            }
        }
    }
}

#Preview {
    CardsOnboardingScreen()
}
