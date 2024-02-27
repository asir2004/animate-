import SwiftUI
import AVKit

struct AnimationPrincipleDetailScreen: View {
    var animationPrinciple: AnimationPrinciple
    
    @State var player: AVPlayer?
    @State var asset: AVAsset?
    
    @State var timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VHStack {
                if player != nil {
                    GeometryReader { subGeoSize in
                        VideoPlayer(player: player)
                            .controlSize(.mini)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 20)
                            )
                            .frame(height: subGeoSize.size.width / 16 * 9)
                    }
                    .aspectRatio(16/9, contentMode: .fit)
                    .padding()
                }
                
                List {
                    Section(content: {
                        VStack(alignment: .leading, spacing: 5) {
                            Text(animationPrinciple.name)
                                .font(.title)
                                .bold()
                            
                            Divider()
                            
                            Text(animationPrinciple.detail)
                        }
                    }, footer: {
                        Text("From Wikipedia")
                    })
                }
            }
            .onAppear {
                player = AVPlayer(url: Bundle.main.url(forResource: animationPrinciple.name, withExtension: "mov")!)
                asset = AVAsset(url: Bundle.main.url(forResource: animationPrinciple.name, withExtension: "mov")!)
                player!.play()
                timer = Timer.publish(every: asset!.duration.seconds, on: .main, in: .common).autoconnect()
            }
            .onReceive(timer) { _ in
                player!.seek(to: .zero)
                player!.play()
            }
            .navigationTitle(animationPrinciple.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AnimationPrincipleDetailScreen(animationPrinciple: .init(name: "Staging", image: "questionmark", detail: "This is a preview animation principle."))
}
