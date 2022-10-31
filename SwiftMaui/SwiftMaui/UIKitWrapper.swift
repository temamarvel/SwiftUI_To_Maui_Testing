//
//  UIKitWrapper.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 29.10.2022.
//

import Foundation
import UIKit
import SwiftUI

class Counter : NSObject, ObservableObject{
    @Published var counter = 0
}

@objc public class UIKitWrapper: NSObject, ObservableObject {
    //@ObservedObject private var counter = Counter()
    //@Published var superCounter = 0
    
    
    var counter : Counter = Counter()
    var swiftView : SwiftUIView?
    var hostingController: UIHostingController<SwiftUIView>?

    @objc public var counterValue : Int = 0
    
//    @objc public var testProperty : Int {
//        guard let view = swiftView else {
//            return 0
//        }
//        return view.counter
//    }
    
    @objc public var uiView: UIView? {
        hostingController?.view
    }
    @objc public var viewController: UIViewController? { hostingController }

    @objc public func createSwiftView() {
        swiftView = SwiftUIView(counter: counter)
        createController(swiftView: swiftView!)
        setCounter(value: 10)
    }
    @objc public func setCounter(value: Int) {
        counter.counter = value
    }
    
    func createController(swiftView: SwiftUIView) {
        hostingController = UIHostingController(rootView: swiftView)
    }
}
