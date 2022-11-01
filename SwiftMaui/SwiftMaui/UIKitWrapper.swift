//
//  UIKitWrapper.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 29.10.2022.
//

import Foundation
import UIKit
import SwiftUI

class MyHosting<Content> : UIHostingController<Content> where Content : View {
    required override init(rootView: Content) {
        super.init(rootView: rootView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


protocol UIKitWrapper : NSObject, ObservableObject {
    associatedtype Swift where Swift: View
    associatedtype Kit
    associatedtype Controller where Controller : MyHosting<Swift>
    
    var uiView: Kit? { get }
    var swiftUIView : Swift? { get set }
    var hostingController : Controller? { get set}
    func createSwiftUIView() -> Void
}

extension UIKitWrapper {
    func createController(view: Swift){
        hostingController = Controller(rootView: view)
    }
}

@objc public class MySwiftUIView: NSObject, UIKitWrapper {
    typealias Swift = SwiftUIView
    typealias Kit = UIView
    typealias Controller = MyHosting<SwiftUIView>
    
    var swiftUIView : SwiftUIView?
    var hostingController: MyHosting<SwiftUIView>?
    
    @objc @Published public var counter = 0 {
        didSet {
            guard let handler = onChangedHandler else { return }
            handler(counter)
        }
    }
    
    @objc public var onChangedHandler : ((Int) -> Void)?
    @objc public var uiView: UIView? {
        hostingController?.view
    }
    @objc public var viewController: UIViewController? { hostingController }
    @objc public func createSwiftUIView() {
        swiftUIView = SwiftUIView(viewModel: self)
        createController(view: swiftUIView!)
    }
    
//    func createController(swiftView: SwiftUIView) {
//        hostingController = UIHostingController(rootView: swiftView)
//    }
}
