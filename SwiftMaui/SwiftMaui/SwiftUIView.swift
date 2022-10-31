//
//  SwiftUIView.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 29.10.2022.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var counter: Counter
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Count \(counter.counter)")
            Button("Increase"){
                increase()
            }
            Button("Decrease"){
                decrease()
            }
        }
    }
    
    func increase() -> Void {
        counter.counter += 1
    }
    
    func decrease() -> Void {
        counter.counter -= 1
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var counter = Counter()
    
    static var previews: some View {
        SwiftUIView(counter: counter)
    }
}
