//
//  SwiftUIView.swift
//  TestSwiftUILib
//
//  Created by Артем Денисов on 27.10.2022.
//

import SwiftUI

struct SwiftUIView: View {
    @State var counter = 0
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Count \(counter)")
            Button("Increase"){
                increase()
            }
            Button("Decrease"){
                decrease()
            }
        }
    }
    
    func increase() -> Void {
        counter += 1
    }
    
    func decrease() -> Void {
        counter -= 1
    } 
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
