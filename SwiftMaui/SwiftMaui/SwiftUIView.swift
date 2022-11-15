//
//  SwiftUIView.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 29.10.2022.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel: MySwiftUIView
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Count \(viewModel.counter)")
            Button("Increase"){
                increase()
            }
            Button("Decrease"){
                decrease()
            }

            if let template = viewModel.itemTemplate {
                TemplateView(item: .constant(template))
            }
            //TemplateView(item: .constant(UILabel()))
            
            //NewTextEdit()
        }
    }
    
    func increase() -> Void {
        viewModel.counter += 1
    }
    
    func decrease() -> Void {
        viewModel.counter -= 1
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var counter = MySwiftUIView()
    
    static var previews: some View {
        SwiftUIView(viewModel: counter)
    }
}
