//
//  TemplatedItemView.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 16.11.2022.
//

import SwiftUI

struct TemplatedItem: View {
    @ObservedObject var viewModel : TemplatedItemView
    
    
    var body: some View {
        if let template = viewModel.itemTemplate {
            TemplateView(item: .constant(template))
        }
    }
}

struct TemplatedItem_Previews: PreviewProvider {
    static var viewModel = TemplatedItemView()
    
    static var previews: some View {
        TemplatedItem(viewModel: viewModel)
    }
}
