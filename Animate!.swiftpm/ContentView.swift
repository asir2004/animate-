import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geoSize in
            if geoSize.size.width > 450 {
                NavigationSplitView(sidebar: {
                    List {
                        Section {
                            NavigationLink {
                                LearnView()
                            } label: {
                                Label("Learn", systemImage: "pencil")
                            }
                            
                            NavigationLink {
                                ExploreView()
                            } label: {
                                Label("Explore", systemImage: "globe")
                            }
                        }
                    }
                    .navigationTitle("Animate!")
                    .listStyle(.insetGrouped)
                }, detail: {
                    LearnView()
                })
            } else {
                TabView {
                    LearnView()
                        .tabItem {
                            Label("Learn", systemImage: "pencil")
                        }
                    
                    ExploreView()
                        .tabItem {
                            Label("Explore", systemImage: "globe")
                        }
                }
            }
        }
    }
}
