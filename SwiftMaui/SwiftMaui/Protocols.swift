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
    //TODO: do it in extension
    func createSwiftUIView() -> Void
}

extension UIKitWrapper {
    func createController(view: Swift){
        hostingController = Controller(rootView: view)
    }
    
    
}
