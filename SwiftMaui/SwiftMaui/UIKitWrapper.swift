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

//@objc public protocol UIViewHost{
//    var uiView: UIView? { get }
//}
//
//protocol UIKitWrapper : NSObject, ObservableObject {
//    associatedtype Swift where Swift: View
//    associatedtype Controller where Controller : MyHosting<Swift>
//    
//    //var uiView: Kit? { get }
//    var swiftUIView : Swift? { get set }
//    var hostingController : Controller? { get set}
//    //TODO: do it in extension
//    func createSwiftUIView() -> Void
//}
//
//extension UIKitWrapper {
//    func createController(view: Swift){
//        hostingController = Controller(rootView: view)
//    }
//}

@objc public class MySwiftUIView: NSObject, UIViewHost , UIKitWrapper {
    typealias Swift = SwiftUIView
    //typealias Kit = UIView
    typealias Controller = MyHosting<SwiftUIView>
    
    var swiftUIView : SwiftUIView?
    var hostingController: MyHosting<SwiftUIView>?
    
    @objc @Published public var counter = 0 {
        didSet {
            guard let handler = onChangedHandler else { return }
            handler(counter)
        }
    }
    @objc public var itemTemplate : UIView?
    
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


@objc public class MyTextWrapper: NSObject, UIViewHost, UIKitWrapper {
    typealias Swift = TextWrapperView
    typealias Kit = UIView
    typealias Controller = MyHosting<TextWrapperView>

    public override init() {
        super.init()
        createSwiftUIView()
    }

    var swiftUIView : Swift?
    var hostingController: MyHosting<TextWrapperView>?
    @objc public var uiView: UIView? {
        hostingController?.view
    }

    func createSwiftUIView() {
        swiftUIView = TextWrapperView()
        createController(view: swiftUIView!)
    }
    
    
}

//TODO: a lot of boilerplate code
//public class TextWrapper2 : NSObject, UIKitWrapper{
//    var uiView: UIView?
//
//    var swiftUIView: TextWrapperView?
//
//    var hostingController: MyHosting<TextWrapperView>?
//
//    typealias Swift = TextWrapperView
//
//    typealias Kit = UIView
//
//    typealias Controller = MyHosting<TextWrapperView>
//
//    func createSwiftUIView() {
//
//    }
//
//
//}
