//
//  Inrerfaces.swift
//  SwiftMaui
//
//  Created by Артем Денисов on 14.11.2022.
//

import Foundation
import UIKit
import SwiftUI

@objc public protocol UIViewHost{
    var uiView: UIView? { get }
}

protocol UIKitWrapper : NSObject, ObservableObject {
    associatedtype Swift where Swift: View
    associatedtype Controller where Controller : MyHosting<Swift>
    
    //var uiView: Kit? { get }
    var swiftUIView : Swift? { get set }
    var hostingController : Controller? { get set}
    //MARK: method can't have default implementation in UIKitWrapper extension
    //It must reference view-model object, which conforms more than one protocol UIKitWrapper
    //So, you must implement in by yourself 
    
    func createSwiftUIView() -> Void
    init()
}

extension UIKitWrapper {
    //TODO: how to override it
    func createController(view: Swift){
        hostingController = Controller(rootView: view)
        
    }
    
    
}
