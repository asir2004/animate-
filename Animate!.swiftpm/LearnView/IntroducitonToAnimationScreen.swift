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
                    Section("LEARN") {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ANIMATION_SCREEN_SECTION_1_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("ANIMATION_SCREEN_SECTION_1_DETAIL")
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ANIMATION_SCREEN_SECTION_2_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_2_DETAIL_1"))
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_2_DETAIL_2"))
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_2_DETAIL_3"))
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_2_DETAIL_4"))
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ANIMATION_SCREEN_SECTION_3_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_3_DETAIL_1"))
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_3_DETAIL_2"))
                            
                            Text(.init("ANIMATION_SCREEN_SECTION_3_DETAIL_3"))
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ANIMATION_SCREEN_SECTION_4_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("ANIMATION_SCREEN_SECTION_4_DETAIL")
                        }
                        
                        NavigationLink {
                            IntroductionToKeyframeScreen()
                        } label: {
                            Label("CONTINUE_KEYFRAME", systemImage: "arrow.right")
                        }
                    }
                }
                .navigationTitle("ANIMATION")
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
