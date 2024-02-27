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
                    
                    Text("Time-Value Chart")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                }
                .frame(height: deviceIsiPadOrMac() ? 400 : 200)
                
                NavigationStack {
                    List {
                        Section("Learn") {
                            GeometryReader { geoSize in
                                let size = geoSize.size
                                ScrollView(.horizontal) {
                                    HStack(alignment: .top, spacing: 0) {
                                        VStack(alignment: .leading, spacing: 7) {
                                            Text("Linear Animation")
                                                .font(.title)
                                                .bold()
                                            
                                            Divider()
                                            
                                            Text("Linear animation is the animation where object moves at a constant speed.")
                                            
                                            Divider()
                                            
                                            Text("In the time-value chart, you can see the velocity (tangent, steepness) does not change with time.")
                                            
                                            Spacer()
                                            
                                            Button("Next") {
                                                scrollPosition = 2
                                            }
                                        }
                                        .id(1)
                                        .frame(width: size.width)
                                        
                                        VStack(alignment: .leading, spacing: 7) {
                                            Text("Non-linear Animation")
                                                .font(.title)
                                                .bold()
                                            
                                            Divider()
                                            
                                            Text("Non-linear animation is the animation where object moves at a dynamic speed, we can adjust the Bezier controller of keyframe velocity, to adjust the animation.")
                                            
                                            Divider()
                                            
                                            Text("In the time-value chart, you can see the velocity (tangent, steepness) changes with time.")
                                            
                                            Spacer()
                                            
                                            Button("Previous") {
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
                        
                        Section("Do it yourself!") {
                            Group {
                                VStack {
                                    Text("First Keyframe Velocity")
                                    
                                    HStack {
                                        Text("\(firstKeyframeVelocityFactor.formatted())")
                                            .animation(.easeIn, value: firstKeyframeVelocityFactor)
                                            .contentTransition(.numericText(value: firstKeyframeVelocityFactor))
                                        
                                        Slider(value: $firstKeyframeVelocityFactor, in: 0...100, step: 10)
                                            .animation(.bouncy, value: firstKeyframeVelocityFactor)
                                    }
                                }
                                
                                VStack {
                                    Text("Last Keyframe Velocity")
                                    
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
                            Section("Continue") {
                                VStack(alignment: .leading, spacing: 7) {
                                    Text("What do the time–value mappings of different kinds of animations look like?")
                                        .font(.title)
                                        .bold()
                                }
                                
                                NavigationLink {
                                    DiscoverAnimationsTimeValueChartScreen()
                                } label: {
                                    Label("Continue: Discover Various Animations′ Time-Value Chart", systemImage: "arrow.right")
                                }
                            }
                        }
                    }
                    .navigationTitle("Non-Linear Animations")
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
