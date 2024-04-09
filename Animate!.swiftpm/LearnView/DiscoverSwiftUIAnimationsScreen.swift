import SwiftUI

struct DiscoverSwiftUIAnimationsScreen: View {
    var showLink = true
    
    @State private var circleAnimationProgress = false
    @State private var circleAnimationTimeInterval: TimeInterval = 1
    @State private var circleAnimation: Animation = .linear(duration: 0)
    @State private var showCircleAnimationSubstring = false
    
    let timer = Timer.publish(every: 1.7, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VHStack {
                VStack(spacing: 10) {
                    HStack {
                        Spacer()
                        
                        Circle()
                            .foregroundStyle(.red.gradient)
                            .frame(width: 80, height: 80)
                            .offset(x: circleAnimationProgress ? -100 : 100)
                            .animation(circleAnimation, value: circleAnimationProgress)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 0) {
                        Image(systemName: "arrow.up")
                            .offset(x: -93)
                            .opacity(circleAnimationProgress ? 1 : 0.5)
                            .animation(.default, value: circleAnimationProgress)
                        
                        Image(systemName: "arrow.up")
                            .offset(x: 93)
                            .opacity(circleAnimationProgress ? 0.5 : 1)
                            .animation(.default, value: circleAnimationProgress)
                    }
                    
                    Text(CircleAnimationSubstring())
                        .foregroundStyle(.tertiary)
                        .opacity(showCircleAnimationSubstring ? 1 : 0)
                }
                .offset(y: showCircleAnimationSubstring ? 0 : 10)
                .animation(.bouncy, value: showCircleAnimationSubstring)
                .frame(height: deviceIsiPadOrMac() ? 250 : 150)
                .if(deviceIsiPadOrMac()) { content in
                    content
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .padding(.horizontal)
                            .foregroundStyle(.ultraThinMaterial)
                    }
                }
                
                List {
                    Section("DISCOVER") {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("SWIFTUI_ANIMATIONS_SCREEN_SECTION_1_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("SWIFTUI_ANIMATIONS_SCREEN_SECTION_1_DETAIL")
                        }
                        
                        VStack(alignment: .leading) {
                            Label("ANIMATION_TYPE", systemImage: "switch.2")
                            
                            Picker(selection: $circleAnimation) {
                                Text("None")
                                    .tag(Animation.linear(duration: 0))
                                
                                Text("Linear")
                                    .tag(Animation.linear)
                                
                                Text("Ease-In")
                                    .tag(Animation.easeIn)
                                
                                Text("Ease-Out")
                                    .tag(Animation.easeOut)
                                
                                Text("Ease-In-Out")
                                    .tag(Animation.easeInOut)
                                
                                Text("Bouncy")
                                    .tag(Animation.bouncy)
                                
                                Text("Snappy")
                                    .tag(Animation.snappy)
                                
                                Text("Smooth")
                                    .tag(Animation.smooth)
                                
                                Text("Spring")
                                    .tag(Animation.spring)
                                
                                Text("Interactive Spring")
                                    .tag(Animation.interactiveSpring)
                                
                                Text("Interpolating Spring")
                                    .tag(Animation.interpolatingSpring)
                            } label: {
                                Label("CIRCLE_ANIMATION", systemImage: "switch.2")
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 150)
                        }
                        
                        Toggle(isOn: $showCircleAnimationSubstring.animation(.easeInOut), label: {
                            Label("SHOW_ANIMATION_DETAIL_INSIDE_OS", systemImage: "chevron.left.forwardslash.chevron.right")
                        })
                        
                        if showCircleAnimationSubstring {
                            Text(String.init(describing: circleAnimation))
                                .foregroundStyle(.tertiary)
                        }
                    }
                    
                    if !showLink {
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("EXPLORE_MORE_LINKS")
                                    .font(.title)
                                    .bold()
                                
                                Link(destination: URL(string: "https://developer.apple.com/wwdc23/10156")!) {
                                    Label("WWDC23: Explore SwiftUI animation", systemImage: "link")
                                }
                            }
                        }
                    }
                    
                    if showLink {
                        Section("CONTINUE") {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("SWIFTUI_ANIMATIONS_SCREEN_SECTION_2_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text("SWIFTUI_ANIMATIONS_SCREEN_SECTION_2_DETAIL")
                            }
                            
                            NavigationLink {
                                DiscoverSwiftUICodeScreen()
                            } label: {
                                Label("CONTINUE_SWIFTUI_CODE", systemImage: "arrow.right")
                            }
                        }
                    }
                }
            }
            .navigationTitle("SWIFTUI_ANIMATIONS")
            .navigationBarTitleDisplayMode(.inline)
            .onReceive(timer, perform: { _ in
                circleAnimationProgress.toggle()
            })
        }
    }
    
    func CircleAnimationSubstring() -> String {
        var str = String.init(describing: circleAnimation)
        
        if let dotRange = str.range(of: "(") {
            str.removeSubrange(dotRange.lowerBound..<str.endIndex)
        }
        
        return str
    }
}

#Preview {
    DiscoverSwiftUIAnimationsScreen()
}
