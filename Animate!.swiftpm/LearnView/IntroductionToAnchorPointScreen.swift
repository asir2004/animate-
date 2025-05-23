import SwiftUI

struct IntroductionToAnchorPointScreen: View {
    var showLink = true
    
    @State private var showAnchorPointExamples: Bool = true
    
    @State private var rotationDegree: Double = 0
    @State private var scaleValue: Double = 1
    @State private var anchorPoint: UnitPoint = .center
    @State private var absolutePosition: Bool = false
    
    let layout3 = Array(repeating: GridItem(), count: 3)
    
    var body: some View {
        NavigationStack {
            VHStack {
                HStack {
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.tertiary)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20 * scaleValue)
                                .frame(width: 100 * scaleValue, height: 100 * scaleValue)
                                .foregroundStyle(.red.gradient)
                            
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundStyle(.thinMaterial)
                                .offset(x: offsetX() * scaleValue, y: offsetY() * scaleValue)
                        }
                        .rotationEffect(.degrees(rotationDegree), anchor: anchorPoint)
                        .animation(.bouncy, value: scaleValue)
                        .animation(.bouncy, value: rotationDegree)
                        .animation(.bouncy, value: anchorPoint)
                        .animation(.bouncy, value: absolutePosition)
                        .offset(x: absolutePosition ? -offsetX() * scaleValue : 0, y: absolutePosition ? -offsetY() * scaleValue : 0)
                    }
                    
                    Spacer()
                }
                .frame(height: deviceIsiPadOrMac() ? 400 : 200)
                
                List {
                    Section(header: 
                        Button {
                            withAnimation {
                                showAnchorPointExamples.toggle()
                            }
                        } label: {
                            Text(showAnchorPointExamples ? "HIDE" : "SHOW")
                        }
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .overlay(
                            Text("LEARN"),
                            alignment: .leading
                        )
                    ) {
                        if showAnchorPointExamples {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("ANCHOR_POINT_SCREEN_SECTION_1_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text("ANCHOR_POINT_SCREEN_SECTION_1_DETAIL")
                            }
                        }
                        
                        if showAnchorPointExamples {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("ANCHOR_POINT_SCREEN_SECTION_2_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text(.init("ANCHOR_POINT_SCREEN_SECTION_2_DETAIL_1"))
                                
                                Text(.init("ANCHOR_POINT_SCREEN_SECTION_2_DETAIL_2"))
                            }
                        }
                    }
                    
                    Section("LAB") {
                        VStack(alignment: .leading) {
                            HStack {
                                Label("SCALE_FACTOR", systemImage: "arrow.up.left.and.arrow.down.right")
                                
                                Spacer()
                                
                                Text("\(scaleValue.formatted())")
                            }
                            
                            HStack {
                                Text("0.5")
                                    .foregroundStyle(.tertiary)
                                
                                Slider(value: $scaleValue, in: 0.5...1.5, step: 0.1)
                                
                                Text("1.5")
                                    .foregroundStyle(.tertiary)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Label("ROTATION_DEGREES", systemImage: "arrow.clockwise")
                                
                                Spacer()
                                
                                Text("\(Int(rotationDegree))")
                            }
                            
                            HStack {
                                Text("0")
                                    .foregroundStyle(.tertiary)
                                
                                Slider(value: $rotationDegree, in: 0...360)
                                
                                Text("360")
                                    .foregroundStyle(.tertiary)
                            }
                        }
                        
                        HStack {
                            Label("ANCHOR_POINT", systemImage: "rectangle.dashed")
                            
                            Spacer()
                            
                            Picker("ANCHOR_POINT", selection: $anchorPoint, content: {
                                Text("Center")
                                    .tag(UnitPoint.center)
                                
                                Text("TopLeading")
                                    .tag(UnitPoint.topLeading)
                                
                                Text("Top")
                                    .tag(UnitPoint.top)
                                
                                Text("TopTrailing")
                                    .tag(UnitPoint.topTrailing)
                                
                                Text("Leading")
                                    .tag(UnitPoint.leading)
                                
                                Text("Trailing")
                                    .tag(UnitPoint.trailing)
                                
                                Text("BottomLeading")
                                    .tag(UnitPoint.bottomLeading)
                                
                                Text("Bottom")
                                    .tag(UnitPoint.bottom)
                                
                                Text("BottomTrailing")
                                    .tag(UnitPoint.bottomTrailing)
                                
                            })
                            .pickerStyle(.menu)
                            .labelsHidden()
                        }
                        
                        Toggle(isOn: $absolutePosition, label: {
                            Label("PIN_THE_ANCHOR_POINT", systemImage: absolutePosition ? "pin.fill" : "pin")
                                .symbolEffect(.bounce, value: absolutePosition)
                        })
                    }
                    
                    if showLink {
                        Section {
                            VStack(alignment: .leading, spacing: 7) {
                                Text("ANCHOR_POINT_SCREEN_SECTION_3_TITLE")
                                    .font(.title)
                                    .bold()
                                
                                Text("ANCHOR_POINT_SCREEN_SECTION_3_DETAIL")
                            }
                            
                            NavigationLink {
                                EndingScreen()
                            } label: {
                                Label("CONTINUE_ANIMATION_TRIP", systemImage: "flame")
                            }
                        }
                    }
                }
            }
            .navigationTitle("ANCHOR_POINT")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func offsetX() -> CGFloat {
        if [UnitPoint.leading, UnitPoint.topLeading, UnitPoint.bottomLeading].contains(anchorPoint) {
            return -50
        } else if [UnitPoint.trailing, UnitPoint.topTrailing, UnitPoint.bottomTrailing].contains(anchorPoint) {
            return 50
        } else {
            return 0
        }
    }
    
    func offsetY() -> CGFloat {
        if [UnitPoint.top, UnitPoint.topLeading, UnitPoint.topTrailing].contains(anchorPoint) {
            return -50
        } else if [UnitPoint.bottom, UnitPoint.bottomLeading, UnitPoint.bottomTrailing].contains(anchorPoint) {
            return 50
        } else {
            return 0
        }
    }
}

#Preview {
    IntroductionToAnchorPointScreen()
}
