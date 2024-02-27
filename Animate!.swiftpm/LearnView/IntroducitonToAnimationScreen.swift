import SwiftUI

struct IntroductionToAnimationScreen: View {
    var body: some View {
        NavigationStack {
            VHStack {
                HStack {
                    Spacer()
                    
                    IntroductionToAnimationExplanationView()
                    
                    Spacer()
                }
                .frame(height: deviceIsiPadOrMac() ? 250 : 125)
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundStyle(.thinMaterial)
                )
                .padding()
            
                List {
                    Section("Learn") {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("How we see animation?")
                                .font(.title)
                                .bold()
                            
                            Text("In fact, animation is a sequence of pictures which shift quickly, then your brain blends them together let you feel they are moving. In professional terms, this is called persistence of vision.")
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Where are animations used for?")
                                .font(.title)
                                .bold()
                            
                            Text(.init("Animation makes characters come alive in movies, games and other literary and artistic works."))
                            
                            Text(.init("Animation in education makes explaining some theories simple."))
                            
                            Text(.init("Animation makes ads eye-catching."))
                            
                            Text(.init("Using great animations can make user experience (UX) higher level."))
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Using great animations in your app can bring:")
                                .font(.title)
                                .bold()
                            
                            Text(.init("**Visual Feedback**: Proper use of animations can give users a clear feedback, let them know an action is complete."))
                            
                            Text(.init("**Fun and Delight**: Interesting animations can tell a delighting story in your app, let users put their own minds into it."))
                            
                            Text(.init("**Unique Brand Identity**: If you have watched many ads made by tech companies, you can find them unique, like when you see the San Francisco font, you′ll know the ad is Apple′s, even you might haven′t watched the ad yet. Different companies have different animating method."))
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("So how we make it?")
                                .font(.title)
                                .bold()
                            
                            Text("We usually use keyframes to make animations.")
                        }
                        
                        NavigationLink {
                            IntroductionToKeyframeScreen()
                        } label: {
                            Label("Continue: Keyframe", systemImage: "arrow.right")
                        }
                    }
                }
                .navigationTitle("Animation")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct IntroductionToAnimationExplanationView: View {
    @State private var circleState = false
    
    let timer = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Circle()
            .foregroundStyle(.red.gradient)
            .frame(width: 75, height: 75)
            .offset(x: circleState ? -100 : 100)
            .animation(.linear(duration: 2.5), value: circleState)
            .onAppear() {
                Task {
                    try? await Task.sleep(nanoseconds: 0_100_000_000)
                    circleState.toggle()
                }
            }
            .onReceive(timer, perform: { _ in
                circleState.toggle()
            })
    }
}

#Preview {
    IntroductionToAnimationScreen()
}
