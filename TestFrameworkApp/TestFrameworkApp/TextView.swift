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
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            HStack{
                Image(systemName: "person.wave.2.fill")
                TextField("testTitle", text: $text).focused($isFocused)
            }
            .padding([.bottom, .top], 10)
            .overlay(){
                RoundedRectangle(cornerRadius: 4).stroke(isFocused ? focusBorderColor : borderColor, lineWidth: 2)
            }
            Text(text)
            TextField("testTitle", text: $text)
            
        }
    }
}

struct MyTextEdit_Previews: PreviewProvider {
    static var previews: some View {
        MyTextEdit()
    }
}

