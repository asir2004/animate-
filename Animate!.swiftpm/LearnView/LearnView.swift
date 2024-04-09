import SwiftUI

struct LearnView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geoSize in
                if geoSize.size.width > 570 {
                    HStack {
                        List {
                            Section {
//                                Text("Size.width: \(geoSize.size.width)")
                                AnimationIntroductionContentView()
                                
                                NavigationLink(destination: IntroductionToAnimationScreen()) {
                                    Label("START_LEARNING", systemImage: "arrow.right")
                                }
                            }
                        }
                        
                        List {
                            Section {
                                HStack {
                                    Spacer()
                                    
                                    AnimationIntroductionAnimationView()
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                    .navigationTitle("LEARN")
                } else {
                    List {
                        Section {
//                            Text("Size.width: \(geoSize.size.width)")
                            HStack {
                                Spacer()
                                
                                AnimationIntroductionAnimationView()
                                
                                Spacer()
                            }
                        }
                        
                        Section {
                            AnimationIntroductionContentView()
                            
                            NavigationLink(destination: IntroductionToAnimationScreen()) {
                                Label("START_LEARNING", systemImage: "arrow.right")
                            }
                        }
                    }
                    .navigationTitle("LEARN")
                }
            }
        }
    }
}

func deviceIsiPadOrMac() -> Bool {
    return UIDevice.current.userInterfaceIdiom == .pad || UIDevice.current.userInterfaceIdiom == .mac
}

struct AnimationIntroductionAnimationView: View {
    @State private var roundedRectangleCornerRadius: CGFloat = 30
    @State private var roundedRectangleOffsetX: CGFloat = -20
    @State private var animationProgress1 = false
    @State private var animationProgress2 = false
    
    @State private var rotation1: Double = 0
    @State private var rotation2: Double = 0
    @State private var from: CGFloat = 0
    @State private var to: CGFloat = 0
    
    @State private var count = 1
    
    let timer1 = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    let timer2 = Timer.publish(every: 2.5, on: .main, in: .common).autoconnect()
    let timer3 = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.red.gradient)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation2))
                .offset(x: animationProgress1 ? 90 : -85, y: animationProgress1 ? 40 : -40)
                .animation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1), value: animationProgress1)
            
            ZStack {
                RoundedRectangle(cornerRadius: roundedRectangleCornerRadius, style: .continuous)
                    .foregroundStyle(.thinMaterial)
                    .overlay {
                        RoundedRectangle(cornerRadius: roundedRectangleCornerRadius, style: .continuous)
                            .strokeBorder(LinearGradient(colors: [
                                .white.opacity(0.4),
                                .clear,
                                .clear,
                                .white.opacity(0.1),
                            ], startPoint: .topLeading, endPoint: .bottom), lineWidth: 3)
                    }
                
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.teal)
                    
                    Text("\(count)")
                        .font(.title)
                        .monospaced()
                        .contentTransition(.numericText(value: Double(count)))
                }
                .geometryGroup()
                .offset(x: animationProgress1 ? 30 : 40, y: animationProgress1 ? -55 : -65)
            }
            .geometryGroup()
            .frame(width: 150, height: 200)
            .offset(x: roundedRectangleOffsetX)
            
            Circle()
                .trim(from: from, to: to)
                .stroke(.blue.gradient, style: .init(lineWidth: 10, lineCap: .round))
                .frame(width: 120, height: 120)
                .rotationEffect(.degrees(rotation1))
                .rotationEffect(.degrees(rotation2))
                .offset(x: animationProgress2 ? -30 : 60, y: animationProgress2 ? -10 : 20)
        }
        .onAppear {
            Task {
                try? await Task.sleep(nanoseconds: 0_100_000_000)
                
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                    roundedRectangleCornerRadius = roundedRectangleCornerRadius == 30 ? 60 : 30
                    animationProgress1.toggle()
                }
                
                withAnimation(.easeInOut(duration: 2.5)) {
                    roundedRectangleOffsetX = roundedRectangleOffsetX == -50 ? 50 : -50
                    animationProgress2.toggle()
                }
                
                await drawProgressCircle()
            }
        }
        .onReceive(timer1, perform: { _ in
            withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1)) {
                roundedRectangleCornerRadius = roundedRectangleCornerRadius == 30 ? 60 : 30
                animationProgress1.toggle()
            }
        })
        .onReceive(timer2, perform: { _ in
            withAnimation(.easeInOut(duration: 2.5)) {
                roundedRectangleOffsetX = roundedRectangleOffsetX == -50 ? 50 : -50
                animationProgress2.toggle()
            }
        })
        .onReceive(timer3, perform: { _ in
            Task {
                await drawProgressCircle()
            }
        })
        .onAppear {
            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                rotation2 = 360
            }
        }
    }
    
    func drawProgressCircle() async {
        withAnimation(.easeIn(duration: 1)) {
            to = 1
        }
        try? await Task.sleep(nanoseconds: 0_500_000_000)
        withAnimation(.easeOut(duration: 1)) {
            from = 0.95
        }
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        rotation1 -= 18
        to = 0.05
        from = 0
        if (count >= 9) { withAnimation { count = 0 } }
        withAnimation {
            count += 1
        }
    }
}

struct AnimationIntroductionContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("WELCOME_TO_THE_WORLD_OF_ANIMATION_TITLE")
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            
            Text("WELCOME_TO_THE_WORLD_OF_ANIMATION_DETAIL_1")
                .padding(.bottom, 5)
            
            Text("WELCOME_TO_THE_WORLD_OF_ANIMATION_DETAIL_2")
        }
    }
}

#Preview {
    LearnView()
}
