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
                                Text("KEYFRAME_SCREEN_SECTION_1_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text("KEYFRAME_SCREEN_SECTION_1_DETAIL_1")
                                
                                Text("KEYFRAME_SCREEN_SECTION_1_DETAIL_2")
                            }
                        }
                        
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("KEYFRAME_SCREEN_SECTION_2_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text("KEYFRAME_SCREEN_SECTION_2_DETAIL")
                            }
                            
                            NavigationLink {
                                IntroductionToTimeValueChartScreen()
                            } label: {
                                Label("CONTINUE_TIME_VALUE_CHART", systemImage: "arrow.right")
                            }
                        }
                    }
                    .navigationTitle("KEYFRAME")
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
                
                Text("KEYFRAME_1")
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
                
                Text("KEYFRAME_2")
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
