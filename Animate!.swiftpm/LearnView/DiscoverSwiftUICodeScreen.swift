import SwiftUI

struct DiscoverSwiftUICodeScreen: View {
    var showLink = true
    
    @State private var xOffset = 0
    
    @State private var valueIsAdded = false
    @State private var relationWithValueIsAdded = false
    @State private var animationModifierIsAdded = false
    @State private var animationModifierDetailIsAdded = false
    @State private var buttonIsAdded = false
    @State private var showAnimatableDetails = false
    
    var body: some View {
        NavigationStack {
            VHStack {
                VStack {
                    ScrollView {
                        VStack(alignment: .leading) {
                            Group {
                                if showAnimatableDetails {
                                    Text("In SwiftUI, an animation consists of two parts, Animatable and Animation.")
                                        .padding(.bottom, 20)
                                }
                                
                                if !showAnimatableDetails {
                                    Text("struct LearnAnimationView(): View {")
                                        .monospaced()
                                        .foregroundStyle(.secondary)
                                }
                                
                                if valueIsAdded {
                                    Group {
                                        Text("  @State private var ")
                                            .monospaced()
                                            .bold()
                                        + Text("xOffset = 0")
                                            .monospaced()
                                        
                                        Text("")
                                            .monospaced()
                                    }
                                }
                                
                                Text("  var body: some View {")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                Text("    VStack {")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                Text("      Rectangle()")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                Text("      .frame(width: 30, height: 30)")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                
                                if relationWithValueIsAdded {
                                    if showAnimatableDetails {
                                        HStack {
                                            Text("      .offset(x: CGFloat(xOffset))")
                                                .monospaced()
                                            
                                            Text(.init("This is an **Animatable** attribute."))
                                                .foregroundColor(.red)
                                        }
                                    } else {
                                        Text("      .offset(x: CGFloat(xOffset))")
                                            .monospaced()
                                    }
                                } else {
                                    Text("      .offset()")
                                        .monospaced()
                                        .foregroundStyle(.secondary)
                                }
                                
                                if animationModifierIsAdded {
                                    if animationModifierDetailIsAdded {
                                        HStack {
                                            Text("      .animation(.bouncy, value: xOffset)")
                                                .monospaced()
                                            
                                            if showAnimatableDetails {
                                                Text(.init("This is **Animation**."))
                                                    .foregroundColor(.red)
                                            }
                                        }
                                    } else {
                                        Text("      .animation( , value: )")
                                            .monospaced()
                                    }
                                }
                                
                                if buttonIsAdded {
                                    Text("")
                                        .monospaced()
                                    Text("      Button(\"Trigger!\") {")
                                        .monospaced()
                                    Text("        value = value == 0 ? 40")
                                        .monospaced()
                                    Text("      }")
                                        .monospaced()
                                }
                                
                                Text("    }")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                Text("  }")
                                    .monospaced()
                                    .foregroundStyle(.secondary)
                                
                                if !showAnimatableDetails {
                                    Text("}")
                                        .monospaced()
                                        .foregroundStyle(.secondary)
                                }
                            }
                            .font(.system(size: 15))
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .animation(.bouncy, value: xOffset)
                                .offset(x: CGFloat(xOffset))
                            
                            if buttonIsAdded {
                                Button("Trigger!") {
                                    xOffset = xOffset == 0 ? 50 : 0
                                }
                            }
                        }
                        .padding()
                        
                        Spacer()
                    }
                    .frame(height: deviceIsiPadOrMac() ? 200 : 100)
                    .background {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .foregroundStyle(.ultraThinMaterial)
                    }
                }
                .padding()
                .frame(minHeight: 300, idealHeight: showAnimatableDetails ? 600 : 400, maxHeight: 700)
                
                List {
                    Section("Explore") {
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Discover SwiftUI Codes")
                                .font(.title)
                                .bold()
                            
                            Text("We already learned several kinds of animations, so how to add them into your app?")
                        }
                        
                        Toggle("Add a Variable", systemImage: valueIsAdded ? "checkmark" : "circle.dotted", isOn: $valueIsAdded.animation())
                            .symbolEffect(.bounce, value: valueIsAdded)
                            .foregroundStyle(valueIsAdded ? .primary : .secondary)
                        
                        Toggle("Make Property You Want to Animate Related with Variable", systemImage: relationWithValueIsAdded ? "checkmark" : "circle.dotted", isOn: $relationWithValueIsAdded.animation())
                            .symbolEffect(.bounce, value: relationWithValueIsAdded)
                            .foregroundStyle(relationWithValueIsAdded ? .primary : .secondary)
                        
                        Toggle("Add .animation() Modifier", systemImage: animationModifierIsAdded ? "checkmark" : "circle.dotted", isOn: $animationModifierIsAdded.animation())
                            .symbolEffect(.bounce, value: animationModifierIsAdded)
                            .foregroundStyle(animationModifierIsAdded ? .primary : .secondary)
                        
                        Toggle("Choose Animation", systemImage: animationModifierDetailIsAdded ? "checkmark" : "circle.dotted", isOn: $animationModifierDetailIsAdded.animation())
                            .symbolEffect(.bounce, value: animationModifierDetailIsAdded)
                            .foregroundStyle(animationModifierDetailIsAdded ? .primary : .secondary)
                        
                        Toggle("Add Button or Something That Can Change the Value", systemImage: buttonIsAdded ? "checkmark" : "circle.dotted", isOn: $buttonIsAdded.animation())
                            .symbolEffect(.bounce, value: buttonIsAdded)
                            .foregroundStyle(buttonIsAdded ? .primary : .secondary)
                        
                        Toggle("Show SwiftUI Details", systemImage: showAnimatableDetails ? "exclamationmark" : "questionmark", isOn: $showAnimatableDetails.animation())
                            .symbolEffect(.bounce, value: buttonIsAdded)
                            .foregroundStyle(showAnimatableDetails ? .primary : .secondary)
                            .disabled(!(valueIsAdded && relationWithValueIsAdded && animationModifierIsAdded && animationModifierDetailIsAdded && buttonIsAdded))
                    }
                    
                    if !showLink {
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Explore more")
                                    .font(.title)
                                    .bold()
                                
                                Link(destination: URL(string: "https://developer.apple.com/wwdc23/10156")!) {
                                    Label("WWDC23: Explore SwiftUI animation", systemImage: "link")
                                }
                            }
                        }
                    }
                    
                    if showLink {
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Anchor Point")
                                    .font(.title)
                                    .bold()
                            }
                            
                            NavigationLink {
                                IntroductionToAnchorPointScreen()
                            } label: {
                                Label("Continue: Anchor Point", systemImage: "arrow.right")
                            }
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI Code")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DiscoverSwiftUICodeScreen()
}
