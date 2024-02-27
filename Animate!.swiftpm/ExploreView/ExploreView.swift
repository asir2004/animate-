import SwiftUI

struct ExploreView: View {
    let layout1 = Array(repeating: GridItem(), count: 1)
    let layout2 = Array(repeating: GridItem(), count: 2)
    let layout3 = Array(repeating: GridItem(), count: 3)
    let layout4 = Array(repeating: GridItem(), count: 4)
    
    @State private var transGeoSize: CGFloat?
    @State private var showAboutMe = false
    
    var body: some View {
        NavigationStack {
            GeometryReader { geoSize in
                if geoSize.size.width < 550 {
                    List {
                        Section("Credits / Material used") {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Wikipedia content used in animation principles′ detail page.")
                                
                                Link(destination: URL(string: "https://en.wikipedia.org/wiki/Twelve_basic_principles_of_animation")!) {
                                    Label("Wikipedia - Twelve basic principles of animation", systemImage: "link")
                                }
                            }
                        }
                        
                        Section("Review") {
                            NavigationLink {
                                IntroductionToNonLinearAnimationScreen(showLink: false)
                            } label: {
                                Label("Time-Value Chart", systemImage: "point.topleft.down.to.point.bottomright.curvepath.fill")
                            }
                            
                            NavigationLink {
                                DiscoverSwiftUIAnimationsScreen(showLink: false)
                            } label: {
                                Label("SwiftUI Animations", systemImage: "circlebadge.2")
                            }
                            
                            NavigationLink {
                                DiscoverSwiftUICodeScreen(showLink: false)
                            } label: {
                                Label("SwiftUI Code", systemImage: "chevron.left.forwardslash.chevron.right")
                            }
                            
                            NavigationLink {
                                IntroductionToAnchorPointScreen(showLink: false)
                            } label: {
                                Label("Anchor Point", systemImage: "rectangle")
                            }
                        }
                        
                        Section(content: {
                            ForEach(TwelveAnimationPrinciples.indices) { index in
                                NavigationLink {
                                    AnimationPrincipleDetailScreen(animationPrinciple: TwelveAnimationPrinciples[index])
                                } label: {
                                    HStack {
                                        Image(TwelveAnimationPrinciples[index].name)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(color: .black.opacity(0.1), radius: 5)
                                        
                                        Text(TwelveAnimationPrinciples[index].name)
                                    }
                                }
                            }
                        }, header: {
                            Text("12 Basic Animation Principles")
                        }, footer: {
                            Text("From Wikipedia")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                        })
                        
                        Section(header:
                            Button {
                                withAnimation {
                                    showAboutMe.toggle()
                                }
                            } label: {
                                Text(showAboutMe ? "Hide" : "Show")
                            }
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .overlay(
                                Text("About Me"),
                                alignment: .leading
                            )
                        ) {
                            if showAboutMe {
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 7) {
                                        Text("Hi! I′m…")
                                        
                                        Text("Mark View")
                                            .font(.title)
                                            .bold()
                                        
                                        Text("Sophomore at Software Engineering")
                                        Text("Freelance Motion Designer")
                                    }
                                    
                                    Spacer()
                                    
                                    Image("MarkView")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                } else {
                        HStack {
                            List {
                                Section("Credits / Material used") {
                                    VStack(alignment: .leading, spacing: 7) {
                                        Text("Wikipedia content used in animation principles′ detail page.")
                                        
                                        Link(destination: URL(string: "https://en.wikipedia.org/wiki/Twelve_basic_principles_of_animation")!) {
                                            Label("Wikipedia - Twelve basic principles of animation", systemImage: "link")
                                        }
                                    }
                                }
                                
                                Section("Review") {
                                    NavigationLink {
                                        IntroductionToNonLinearAnimationScreen(showLink: false)
                                    } label: {
                                        Label("Time-Value Chart", systemImage: "point.topleft.down.to.point.bottomright.curvepath.fill")
                                    }
                                    
                                    NavigationLink {
                                        DiscoverSwiftUIAnimationsScreen(showLink: false)
                                    } label: {
                                        Label("SwiftUI Animations", systemImage: "circlebadge.2")
                                    }
                                    
                                    NavigationLink {
                                        DiscoverSwiftUICodeScreen(showLink: false)
                                    } label: {
                                        Label("SwiftUI Code", systemImage: "chevron.left.forwardslash.chevron.right")
                                    }
                                    
                                    NavigationLink {
                                        IntroductionToAnchorPointScreen(showLink: false)
                                    } label: {
                                        Label("Anchor Point", systemImage: "rectangle")
                                    }
                                }
                                
                                Section(header:
                                    Button {
                                        withAnimation {
                                            showAboutMe.toggle()
                                        }
                                    } label: {
                                        Text(showAboutMe ? "Hide" : "Show")
                                    }
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .overlay(
                                        Text("About Me"),
                                        alignment: .leading
                                    )
                                ) {
                                    if showAboutMe {
                                        HStack(alignment: .top) {
                                            VStack(alignment: .leading, spacing: 7) {
                                                Text("Hi! I′m…")
                                                
                                                Text("Mark View")
                                                    .font(.title)
                                                    .bold()
                                                
                                                Text("Sophomore at Software Engineering")
                                                Text("Freelance Motion Designer")
                                            }
                                            
                                            Spacer()
                                            
                                            Image("MarkView")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .scaledToFit()
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }
                            
                            GeometryReader { subGeoSize in
                                ScrollView {
                                    VStack {
                                        LazyVGrid(columns: gridLayout(width: subGeoSize.size.width)) {
                                            ForEach(TwelveAnimationPrinciples.indices) { index in
                                                NavigationLink {
                                                    AnimationPrincipleDetailScreen(animationPrinciple: TwelveAnimationPrinciples[index])
                                                } label: {
                                                    AnimationPrincipleCardView(animationPrinciple: TwelveAnimationPrinciples[index])
                                                }
                                                .foregroundStyle(.primary)
                                                .padding(5)
                                            }
                                        }
                                        .padding(10)
                                        
                                        Text("From Wikipedia")
                                            .foregroundStyle(.secondary)
                                            .font(.footnote)
                                    }
                                }
                            }
                        }
                    }
            }
            .navigationTitle("Explore")
        }
    }
    
    func gridLayout(width: Double) -> [GridItem] {
        if width > 600 {
            return layout4
        } else if width <= 600 && width > 450 {
            return layout3
        } else if width <= 450 && width > 300 {
            return layout2
        } else {
            return layout1
        }
    }
}

struct AnimationPrincipleCardView: View {
    var animationPrinciple: AnimationPrinciple
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4.0)
                .aspectRatio(1.0, contentMode: ContentMode.fit)
                .foregroundStyle(.thinMaterial)
            
//            Image(systemName: animationPrinciple.image)
//                .font(.system(size: 60))
//                .foregroundStyle(.tertiary)
//                .mask(LinearGradient(colors: [.primary, .clear], startPoint: .top, endPoint: .bottom))
            
            Image(animationPrinciple.name)
                .resizable()
                .scaledToFill()
                .aspectRatio(1, contentMode: .fit)
                .mask(LinearGradient(colors: [
                    .black, .clear
                ], startPoint: .top, endPoint: .bottom))
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(animationPrinciple.name)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }
}

#Preview {
    ExploreView()
}
