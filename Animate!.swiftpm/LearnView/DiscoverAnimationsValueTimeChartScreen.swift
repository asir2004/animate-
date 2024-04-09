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
                                    Text("LINEAR")
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
                                    Text("EASE_IN")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("EASE_IN_EXPLANATIONS")
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
                                    Text("EASE_OUT")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("EASE_OUT_EXPLANATIONS")
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
                                    Text("EASE_IN_OUT")
                                        .modifier(animationTitleStyle())
                                    
                                    Text("EASE_IN_OUT_EXPLANATIONS")
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
                        Section("CONTINUE") {
                            VStack {
                                Text("VARIOUS_CHARTS_SCREEN_TITLE")
                                    .font(.title)
                                    .bold()
                            }
                            
                            NavigationLink {
                                DiscoverSwiftUIAnimationsScreen()
                            } label: {
                                Label("CONTINUE_SWIFTUI_ANIMATIONS", systemImage: "arrow.right")
                            }
                        }
                    }
                }
            }
            .navigationTitle("DIFFERENT_KINDS_OF_CHART")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DiscoverAnimationsTimeValueChartScreen()
}
