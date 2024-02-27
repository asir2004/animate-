import SwiftUI

struct DiscoverAnimationsTimeValueChartScreen: View {
    var showLink = true
    
    let layout1 = Array(repeating: GridItem(), count: 1)
    let layout2 = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        NavigationStack {
            VHStack {
                GeometryReader { geoSize in
                    List {
                        Section {
                            LazyVGrid(columns: geoSize.size.width < 550 ? layout1 : layout2, spacing: 15) {
                                VStack(alignment: .leading) {
                                    Text("Linear")
                                        .modifier(animationTitleStyle())
                                    
                                    Spacer()
                                    
                                    BezierCurveView(firstKeyframeVelocityFactor: 0, lastKeyframeVelocityFactor: 0)
                                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .foregroundStyle(.gray.gradient)
                                        .frame(height: 100)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.thinMaterial)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Ease-In")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("The object gradually increases its velocity after animation starts.")
                                        .modifier(animationDetailStyle())
                                    
                                    Spacer()
                                    
                                    BezierCurveView(firstKeyframeVelocityFactor: 50, lastKeyframeVelocityFactor: 0)
                                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .foregroundStyle(.red.gradient)
                                        .frame(height: 100)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.thinMaterial)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Ease-Out")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("The object gradually decreases its velocity before animation ends.")
                                        .modifier(animationDetailStyle())
                                    
                                    Spacer()
                                    
                                    BezierCurveView(firstKeyframeVelocityFactor: 0, lastKeyframeVelocityFactor: 50)
                                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .foregroundStyle(.red.gradient)
                                        .frame(height: 100)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.thinMaterial)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Ease-In-Out")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("The combination of ease-in and ease-out animation.")
                                        .modifier(animationDetailStyle())
                                    
                                    Spacer()
                                    
                                    BezierCurveView(firstKeyframeVelocityFactor: 50, lastKeyframeVelocityFactor: 50)
                                        .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                                        .foregroundStyle(.red.gradient)
                                        .frame(height: 100)
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.thinMaterial)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
                
                if showLink {
                    List {
                        Section("Continue") {
                            VStack {
                                Text("What′s the difference between various kinds of animation?")
                                    .font(.title)
                                    .bold()
                            }
                            
                            NavigationLink {
                                DiscoverSwiftUIAnimationsScreen()
                            } label: {
                                Label("Continue: Discover Different Kinds of Animation in SwiftUI", systemImage: "arrow.right")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Different Kinds of Time-Value Chart")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DiscoverAnimationsTimeValueChartScreen()
}
