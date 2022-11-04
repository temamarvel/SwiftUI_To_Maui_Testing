//
//  ContentView.swift
//  TestFrameworkApp
//
//  Created by Артем Денисов on 03.11.2022.
//

import SwiftUI
//import SwiftMaui

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            MyTextEdit()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
