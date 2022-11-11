//
//  NewTextEdit.swift
//  TestFrameworkApp
//
//  Created by Артем Денисов on 07.11.2022.
//

import SwiftUI


//TODO: make it public and mutating
struct RShape: Shape {
    let radius = 10.0
    @Binding var gap : CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: gap+radius, y: 0))
        path.addLine(to: CGPoint(x: rect.width - radius, y: 0))
        path.addArc(center: CGPoint(x: rect.width - radius, y: radius),
                    radius: radius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: .zero)
        
        return path
    }
}


struct NewTextEdit: View {
    @State private var text = "testText"
    let borderColor = Color.red
    let focusBorderColor = Color.green
    @FocusState private var isFocused : Bool
    @State private var padding : CGFloat = 10
    let placeholder = "1234567889"
    let lableIndent : CGFloat = 5
    var scalePlaceholder : Bool { isFocused || text.count > 0 }
    @State private var labelWidth : CGFloat = 0
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image(systemName: "person.crop.circle.fill")
                
                TextField("", text: $text)
                    .focused($isFocused)
                    .overlay(){
                        GeometryReader{ geometry in
                            HStack{
                                Text("\(placeholder)")
                                    .font(scalePlaceholder ? .caption2 : .body)
                                    .offset(x: scalePlaceholder ? -geometry.frame(in: .named("stack")).origin.x + lableIndent : 0,
                                            y: scalePlaceholder ? -(geometry.size.height / 2 + padding) : 0)
                                    .animation(.linear(duration: 0.1), value: scalePlaceholder)
                                    .background{
                                        GeometryReader{ (geometry) -> Color in
                                            DispatchQueue.main.async {
                                                labelWidth = geometry.size.width
                                            }
                                            return Color.clear
                                            
                                        }
                                        
                                    }
                            }
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height,
                                   alignment: .init(horizontal: .leading, vertical: .center))
                        }
                    }
                
                Button { clear() } label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(Color.secondary)
                }
            }
            .padding(padding)
            .coordinateSpace(name: "stack")
            .background(){
                GeometryReader{ geometry in
                    RShape(gap: scalePlaceholder ? $labelWidth : .constant(0))
                        .stroke(isFocused ? focusBorderColor : borderColor, lineWidth: 2)
                }
            }
        }
        
    }
    
    func clear(){
        text = ""
    }
}

struct NewTextEdit_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            NewTextEdit()
        }.background(Color.yellow)
    }
}
