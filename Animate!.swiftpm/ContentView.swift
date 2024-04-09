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
                                Label("LEARN", systemImage: "pencil")
                            }
                            
                            NavigationLink {
                                ExploreView()
                            } label: {
                                Label("EXPLORE", systemImage: "globe")
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
                            Label("LEARN", systemImage: "pencil")
                        }
                    
                    ExploreView()
                        .tabItem {
                            Label("EXPLORE", systemImage: "globe")
                        }
                }
            }
        }
    }
}
