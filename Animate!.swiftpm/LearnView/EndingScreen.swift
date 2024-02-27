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
                            Text("Not the End…")
                                .font(.title)
                                .bold()
                            
                            Text("You have finished the introduction to animation! You can now apply the knowledge to your keynotes, apps, web designs and videos!")
                        }
                        
                        VStack(alignment: .leading, spacing: 7) {
                            Text("There′s more to discover!")
                                .font(.title)
                                .bold()
                            
                            Text("You can now open creative apps, like Motion by Apple, try adding some keyframes to a layer, adjusting keyframe′s velocity factor. As you watch and make more animations, you′ll start feeling animation′s feedback, smoothness, delay and emotion.")
                            
                            Text("If you′re planning to use SwiftUI for your app and want to stay up-to-date with the latest APIs from Apple, it′s essential to use the Apple Developer app to watch developer sessions and follow WWDC updates.")
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("And lastly…")
                            
                            Text("Thanks for discovering animations with me!")
                                .font(.title)
                                .bold()
                        }
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Explore more")
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
            .navigationTitle("Congratulations!")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EndingScreen()
}
