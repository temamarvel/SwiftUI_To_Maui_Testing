using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace Bindings.SwiftUIToMaui
{
	// @interface MySwiftUIView : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC9SwiftMaui13MySwiftUIView")]
	interface MySwiftUIView
	{
		// @property (nonatomic) NSInteger counter;
		[Export ("counter")]
		nint Counter { get; set; }

		// @property (copy, nonatomic) void (^ _Nullable)(NSInteger) onChangedHandler;
		[NullAllowed, Export ("onChangedHandler", ArgumentSemantic.Copy)]
		Action<nint> OnChangedHandler { get; set; }

		// @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UiView { get; }

		// @property (readonly, nonatomic, strong) UIViewController * _Nullable viewController;
		[NullAllowed, Export ("viewController", ArgumentSemantic.Strong)]
		UIViewController ViewController { get; }

		// -(void)createSwiftUIView;
		[Export ("createSwiftUIView")]
		void CreateSwiftUIView ();
	}
}
