import SwiftUI
import AVKit

struct EndingScreen: View {
//    @State var player = AVPlayer(url: Bundle.main.url(forResource: "", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack {
            VHStack {
                HStack {
                    Spacer()
                    
                    Image(systemName: "party.popper")
                        .foregroundStyle(LinearGradient(colors: [
                            .red, .yellow, .blue
                        ], startPoint: .topTrailing, endPoint: .bottom))
                        .font(.system(size: 100))
                    
                    Spacer()
                }
                .frame(height: deviceIsiPadOrMac() ? 400 : 200)
                
                List {
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ENDING_SCREEN_SECTION_1_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("ENDING_SCREEN_SECTION_1_DETAIL")
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ENDING_SCREEN_SECTION_2_TITLE")
                                .font(.title)
                                .bold()
                            
                            Text("ENDING_SCREEN_SECTION_2_DETAIL_1")
                            
                            Text("ENDING_SCREEN_SECTION_2_DETAIL_2")
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("ENDING_SCREEN_SECTION_3_TITLE")
                            
                            Text("ENDING_SCREEN_SECTION_3_DETAIL")
                                .font(.title)
                                .bold()
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("EXPLORE_MORE_LINKS")
                                .font(.title)
                                .bold()
                            
                            Link(destination: URL(string: "https://developer.apple.com/wwdc23/10156")!) {
                                Label("WWDC23: Explore SwiftUI animation", systemImage: "link")
                            }
                            
                            Link(destination: URL(string: "https://developer.apple.com/wwdc23/10157")!) {
                                Label("WWDC23: Wind your way through advanced animations in SwiftUI", systemImage: "link")
                            }
                            
                            Link(destination: URL(string: "https://developer.apple.com/wwdc23/10158")!) {
                                Label("WWDC23: Animate with springs", systemImage: "link")
                            }
                            
                            Link(destination: URL(string: "https://developer.apple.com/wwdc23/10257")!) {
                                Label("WWDC23: Animate symbols in your app", systemImage: "link")
                            }
                            
                            Link(destination: URL(string: "https://developer.apple.com/wwdc23/10258")!) {
                                Label("WWDC23: Create animated symbols", systemImage: "link")
                            }
                        }
                    }
                }
            }
            .navigationTitle("CONGRATULATIONS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EndingScreen()
}
