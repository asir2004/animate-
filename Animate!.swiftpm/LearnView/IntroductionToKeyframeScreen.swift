import SwiftUI

struct IntroductionToKeyframeScreen: View {
    var body: some View {
        NavigationStack {
            VHStack {
                HStack {
                    Spacer()
                    
                    IntroductionToKeyframeExplanationView()
                    
                    Spacer()
                }
                .frame(height: deviceIsiPadOrMac() ? 250 : 125)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.thinMaterial)
                }
                .padding()
                
                NavigationStack {
                    List {
                        Section("Learn") {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("What is keyframe?")
                                    .font(.title)
                                    .bold()
                                
                                Text("Animation is almost about transition between different objects, or different phases on one object. Keyframes record the “key moment” of one object. Once you have put two or more keyframes on one thing, computer will automatically calculate the value on each frame between two keyframes.")
                                
                                Text("The ways computer calculate the value can be different. Maybe it′s fast near the start, and slow near the end; or opposite... This is where “smooth” be made.")
                            }
                        }
                        
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("How to make it smooth?")
                                    .font(.title)
                                    .bold()
                                
                                Text("We need to learn about velocity, linear animations and ease-in, ease-out, ease-in-out animations.")
                            }
                            
                            NavigationLink {
                                IntroductionToTimeValueChartScreen()
                            } label: {
                                Label("Continue: Time-Value Chart", systemImage: "arrow.right")
                            }
                        }
                    }
                    .navigationTitle("Keyframe")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct IntroductionToKeyframeExplanationView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                ZStack {
                    Image(systemName: "rhombus.fill")
                        .font(.system(size: 40))
                    
                    Text("1")
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .black : .white)
                }
                
                Text("Keyframe 1")
                    .font(.system(size: 10))
                    .monospaced()
            }
            .offset(y: 6)
            
            HStack(spacing: -30) {
                ForEach(Range(1...15)) { number in
                    if number != 15 {
                        Image(systemName: "rhombus")
                            .font(.system(size: 40))
                            .clipShape(
                                Rectangle()
                                    .offset(x: -15)
                            )
                            .opacity(0.06 * Double(number))
                            .shadow(color: colorScheme == .dark ? .black.opacity(1) : .white.opacity(1), radius: 0, x: -5)
                    } else {
                        Image(systemName: "rhombus")
                            .font(.system(size: 40))
                            .shadow(color: colorScheme == .dark ? .black.opacity(1) : .white.opacity(1), radius: 0, x: -5)
                            .opacity(0.06 * Double(number))
                    }
                }
            }
            
            VStack {
                ZStack {
                    Image(systemName: "rhombus.fill")
                        .font(.system(size: 40))
                    
                    Text("2")
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .black : .white)
                }
                
                Text("Keyframe 2")
                    .font(.system(size: 10))
                    .monospaced()
            }
            .offset(y: 6)
        }
    }
}

#Preview {
    IntroductionToKeyframeScreen()
}
