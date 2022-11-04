//
//  SwiftUIView.swift
//
//
//  Created by Артем Денисов on 02.11.2022.
//

import SwiftUI

struct MyTextEdit: View {
    @State private var text = "testText"
    let borderColor = Color.red
    let focusBorderColor = Color.green
    @FocusState private var isFocused : Bool
    @State private var isScale = false
    
    var body: some View {
        
            VStack{
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                

                    
                    HStack{
                        Image(systemName: "person.crop.circle.fill").padding(5)
                        
                        TextField(isScale ? "" : "testTitle", text: $text).focused($isFocused).coordinateSpace(name: "field")
                        
                        Button { text = "" } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color.secondary).padding(5)
                        }
                    }
                    .padding([.bottom, .top], 10)
                    .overlay(){
                        RoundedRectangle(cornerRadius: 4).stroke(isFocused ? focusBorderColor : borderColor, lineWidth: 2)
                    }
                    .overlay(){
                        Text("label")
                            
                            .padding([.horizontal], 5)
                            .background(Color.green)
                            .position(x: 0, y: 0)
                            //.offset(x: frame.midX)
                        
                        //.offset(x: isScale ? -130 : -330, y: isScale ? 0 : -50)
                        //.scaleEffect(isScale ? 1 : 0.5)
                        //.animation(.default, value: isScale)
                        
                        
//                    GeometryReader{ geometry in
//                        let frame = geometry.frame(in: .named("field"))
//
//                        Text("label \(frame.origin.y)")
//
//                            .padding([.horizontal], 5)
//                            .background(Color.green)
//                            .offset(x: frame.midX)
//
//                        //.offset(x: isScale ? -130 : -330, y: isScale ? 0 : -50)
//                        //.scaleEffect(isScale ? 1 : 0.5)
//                        //.animation(.default, value: isScale)
//                    }
                    //.frame(width: 100, height: 100)
                }
                
                
                Text(text)
//                Text("\(reader.frame(in: .named("field")).height)")
//                Text("\(reader.frame(in: .local).height)")
                TextField("testTitle", text: $text)
                Button("Test scale"){
                    isScale.toggle()
                    
                    
                }
            }
        
    }
}

struct MyTextEdit_Previews: PreviewProvider {
    static var previews: some View {
        MyTextEdit()
    }
}
