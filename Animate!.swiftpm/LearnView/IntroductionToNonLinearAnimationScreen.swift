import SwiftUI

struct IntroductionToNonLinearAnimationScreen: View {
    var showLink = true
    
    @State var firstKeyframeVelocityFactor: Double = 0
    @State var lastKeyframeVelocityFactor: Double = 0
    
    @State var scrollPosition: Int?
    
    var body: some View {
        NavigationStack {
            VHStack {
                VStack {
                    BezierCurveView(firstKeyframeVelocityFactor: firstKeyframeVelocityFactor, lastKeyframeVelocityFactor: lastKeyframeVelocityFactor)
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
                .frame(height: deviceIsiPadOrMac() ? 400 : 200)
                
                NavigationStack {
                    List {
                        Section("LEARN") {
                            GeometryReader { geoSize in
                                let size = geoSize.size
                                ScrollView(.horizontal) {
                                    HStack(alignment: .top, spacing: 0) {
                                        VStack(alignment: .leading, spacing: 7) {
                                            Text("LINEAR_ANIMATION")
                                                .font(.title)
                                                .bold()
                                            
                                            Divider()
                                            
                                            Text("LINEAR_ANIMATION_DETAIL_1")
                                            
                                            Divider()
                                            
                                            Text("LINEAR_ANIMATION_DETAIL_2")
                                            
                                            Spacer()
                                            
                                            Button("NEXT") {
                                                scrollPosition = 2
                                            }
                                        }
                                        .id(1)
                                        .frame(width: size.width)
                                        
                                        VStack(alignment: .leading, spacing: 7) {
                                            Text("NON_LINEAR_ANIMATION")
                                                .font(.title)
                                                .bold()
                                            
                                            Divider()
                                            
                                            Text("NON_LINEAR_ANIMATION_DETAIL_1")
                                            
                                            Divider()
                                            
                                            Text("NON_LINEAR_ANIMATION_DETAIL_2")
                                            
                                            Spacer()
                                            
                                            Button("PREVIOUS") {
                                                scrollPosition = 1
                                            }
                                        }
                                        .id(2)
                                        .frame(width: size.width)
                                    }
                                    .scrollTargetLayout()
                                }
                                .scrollIndicators(.visible)
                                .scrollPosition(id: $scrollPosition)
                                .scrollTargetBehavior(.paging)
                                .animation(.bouncy, value: scrollPosition)
                                .onChange(of: scrollPosition) { oldValue, newValue in
                                    if newValue == 1 {
                                        firstKeyframeVelocityFactor = 0
                                        lastKeyframeVelocityFactor = 0
                                    }
                                    if newValue == 2 {
                                        firstKeyframeVelocityFactor = 33
                                        lastKeyframeVelocityFactor = 80
                                    }
                                }
                            }
                            .frame(height: 320)
                        }
                        
                        Section("DO_IT_YOURSELF") {
                            Group {
                                VStack {
                                    Text("FIRST_KEYFRAME_VELOCITY")
                                    
                                    HStack {
                                        Text("\(firstKeyframeVelocityFactor.formatted())")
                                            .animation(.easeIn, value: firstKeyframeVelocityFactor)
                                            .contentTransition(.numericText(value: firstKeyframeVelocityFactor))
                                        
                                        Slider(value: $firstKeyframeVelocityFactor, in: 0...100, step: 10)
                                            .animation(.bouncy, value: firstKeyframeVelocityFactor)
                                    }
                                }
                                
                                VStack {
                                    Text("LAST_KEYFRAME_VELOCITY")
                                    
                                    HStack {
                                        Slider(value: $lastKeyframeVelocityFactor, in: 0...100, step: 10)
                                            .animation(.bouncy, value: lastKeyframeVelocityFactor)
                                            .scaleEffect(x: -1)
                                        
                                        Text("\(lastKeyframeVelocityFactor.formatted())")
                                            .animation(.easeIn, value: firstKeyframeVelocityFactor)
                                            .contentTransition(.numericText(value: firstKeyframeVelocityFactor))
                                    }
                                }
                            }
                            .disabled(scrollPosition == 1 || scrollPosition == nil)
                            .foregroundStyle(scrollPosition == 1 || scrollPosition == nil ? .secondary : .primary)
                        }
                        
                        if showLink {
                            Section("CONTINUE") {
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("NON_LINEAR_ANIMATION_TITLE")
                                        .font(.title)
                                        .bold()
                                }
                                
                                NavigationLink {
                                    DiscoverAnimationsTimeValueChartScreen()
                                } label: {
                                    Label("CONTINUE_VARIOUS_CHARTS", systemImage: "arrow.right")
                                }
                            }
                        }
                    }
                    .navigationTitle("NON_LINEAR_ANIMATION")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct BezierCurveView: Shape {
    var firstKeyframeVelocityFactor: Double = 20
    var lastKeyframeVelocityFactor: Double = 80
    
    var from: Double = 0
    var to: Double = 100
    
    var animatableData: AnimatablePair<Double, AnimatablePair<Double, AnimatablePair<Double, Double>>> {
        get { AnimatablePair(firstKeyframeVelocityFactor, AnimatablePair(lastKeyframeVelocityFactor, AnimatablePair(from, to))) }
        set {
            firstKeyframeVelocityFactor = newValue.first
            lastKeyframeVelocityFactor = newValue.second.first
            from = newValue.second.second.first
            to = newValue.second.second.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.init(
            x: rect.maxX,
            y: rect.minY
        ))
        path.addCurve(
            to: CGPoint(
                x: rect.minX,
                y: rect.maxY
            ),
            control1: CGPoint(
                x: rect.maxX * (1 - (lastKeyframeVelocityFactor / 100)),
                y: rect.minY
            ),
            control2: CGPoint(
                x: rect.maxX * (firstKeyframeVelocityFactor / 100),
                y: rect.maxY
            )
        )
        
        return path.trimmedPath(from: from, to: to)
    }
}

#Preview {
    IntroductionToNonLinearAnimationScreen()
}
