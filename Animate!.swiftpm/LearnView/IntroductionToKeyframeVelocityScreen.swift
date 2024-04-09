import SwiftUI

struct IntroductionToTimeValueChartScreen: View {
    var showLink = true
    
    @State var firstKeyframeVelocityFactor: Double = 0
    @State var lastKeyframeVelocityFactor: Double = 0
    @State var from: Double = 1
    @State var to: Double = 1
    
    @State var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VHStack {
                VStack {
                    BezierCurveView(firstKeyframeVelocityFactor: firstKeyframeVelocityFactor, lastKeyframeVelocityFactor: lastKeyframeVelocityFactor, from: from, to: to)
                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                        .foregroundStyle(Gradient(colors: [.red, .green]))
                        .animation(.bouncy, value: firstKeyframeVelocityFactor)
                        .animation(.bouncy, value: lastKeyframeVelocityFactor)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                    
                    Text("TIME_VALUE_CHART")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .overlay {
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Image(systemName: "arrow.up")
                                Text("ANIMATED_VALUE")
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer()
                            Text("TIME")
                            Image(systemName: "arrow.right")
                        }
                    }
                    .foregroundStyle(.secondary)
                    .padding(20)
                }
                .frame(height: deviceIsiPadOrMac() ? 300 : 200)
                
                List {
                    Section("LEARN") {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("KEYFRAME_VELOCITY_SCREEN_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("KEYFRAME_VELOCITY_SCREEN_DETAIL")
                        }
                    }
                    
                    if showLink {
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("KEYFRAME_VELOCITY_SCREEN_FOOTNOTE")
                                    .font(.title)
                                    .bold()
                            }
                            
                            NavigationLink {
                                IntroductionToNonLinearAnimationScreen()
                            } label: {
                                Label("CONTINUE_NON_LINEAR_ANIMATION", systemImage: "arrow.right")
                            }
                        }
                    }
                }
            }
            .onAppear() {
                Task {
                    try? await Task.sleep(nanoseconds: 0_100_000_000)
                    
                    withAnimation(.spring(duration: 1.5)) {
                        from = 0
                    }
                }
            }
            .onReceive(timer, perform: { _ in
                Task {
                    withAnimation(.easeIn(duration: 0.8)) {
                        to = 0
                    }
                    
                    try? await Task.sleep(nanoseconds: 0_800_000_000)
                    from = 1
                    to = 1
                    
                    withAnimation(.easeOut(duration: 1.2)) {
                        from = 0
                    }
                }
            })
            .navigationTitle("TIME_VALUE_CHART")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    IntroductionToTimeValueChartScreen()
}
