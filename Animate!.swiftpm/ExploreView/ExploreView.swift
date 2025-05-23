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
                        Section("CREDITS_USED") {
                            CreditsUsedListSection()
                        }
                        
                        Section("REVIEW") {
                            ReviewListSection()
                        }
                        
                        Section(content: {
                            ForEach(TwelveAnimationPrinciples.indices) { index in
                                NavigationLink {
                                    AnimationPrincipleDetailScreen(animationPrinciple: TwelveAnimationPrinciples[index])
                                } label: {
                                    HStack {
                                        Image(TwelveAnimationPrinciples[index].movie)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                            .shadow(color: .black.opacity(0.1), radius: 5)
                                        
                                        Text(.init(TwelveAnimationPrinciples[index].name))
                                    }
                                }
                            }
                        }, header: {
                            Text("12_BASIC_ANIMATION_PRINCIPLES")
                        }, footer: {
                            Text("FROM_WIKIPEDIA")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                        })
                        
                        Section(header:
                            ShowAboutMeButton()
                        ) {
                            if showAboutMe {
                                MarkViewAboutMe()
                            }
                        }
                    }
                } else {
                        HStack {
                            List {
                                Section("CREDITS_USED") {
                                    CreditsUsedListSection()
                                }
                                
                                Section("REVIEW") {
                                    ReviewListSection()
                                }
                                
                                Section(header:
                                    ShowAboutMeButton()
                                ) {
                                    if showAboutMe {
                                        MarkViewAboutMe()
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
                                        
                                        Text("FROM_WIKIPEDIA")
                                            .foregroundStyle(.secondary)
                                            .font(.footnote)
                                    }
                                }
                            }
                        }
                    }
            }
            .navigationTitle("EXPLORE")
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
    
    func CreditsUsedListSection() -> some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("WIKIPEDIA_CONTENT_USAGE_ANIMATION_DETAIL_PAGE")
            
            Link(destination: URL(string: "https://en.wikipedia.org/wiki/Twelve_basic_principles_of_animation")!) {
                Label("WIKIPEDIA_LINK_TITLE_12_ANIMATION_PRINCIPLES", systemImage: "link")
            }
        }
    }
    
    func ReviewListSection() -> some View {
        Group {
            NavigationLink {
                IntroductionToNonLinearAnimationScreen(showLink: false)
            } label: {
                Label("TIME_VALUE_CHART", systemImage: "point.topleft.down.to.point.bottomright.curvepath.fill")
            }
            
            NavigationLink {
                DiscoverSwiftUIAnimationsScreen(showLink: false)
            } label: {
                Label("SWIFTUI_ANIMATIONS", systemImage: "circlebadge.2")
            }
            
            NavigationLink {
                DiscoverSwiftUICodeScreen(showLink: false)
            } label: {
                Label("SWIFTUI_CODE", systemImage: "chevron.left.forwardslash.chevron.right")
            }
            
            NavigationLink {
                IntroductionToAnchorPointScreen(showLink: false)
            } label: {
                Label("ANCHOR_POINT", systemImage: "rectangle")
            }
        }
    }
    
    func ShowAboutMeButton() -> some View {
        Button {
            withAnimation {
                showAboutMe.toggle()
            }
        } label: {
            Text(showAboutMe ? "HIDE" : "SHOW")
        }
        .font(.caption)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .overlay(
            Text("ABOUT_ME"),
            alignment: .leading
        )
    }
    
    func MarkViewAboutMe() -> some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 7) {
                Text("MARKVIEW_GREETING_WORDS")
                
                Text("MARKVIEW")
                    .font(.title)
                    .bold()
                
                Text("MARKVIEW_INFORMATION_1")
                Text("MARKVIEW_INFORMATION_2")
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
            
            Image(animationPrinciple.movie)
                .resizable()
                .scaledToFill()
                .aspectRatio(1, contentMode: .fit)
                .mask(LinearGradient(colors: [
                    .black, .clear
                ], startPoint: .top, endPoint: .bottom))
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(.init(animationPrinciple.name))
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
