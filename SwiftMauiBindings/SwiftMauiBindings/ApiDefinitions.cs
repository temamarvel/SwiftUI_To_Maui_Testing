using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace Bindings.SwiftUIToMaui
{
	// @interface UIKitWrapper : NSObject
	[BaseType (typeof(NSObject), Name = "_TtC9SwiftMaui12UIKitWrapper")]
	interface UIKitWrapper
	{
		// @property (copy, nonatomic) void (^ _Nullable)(NSInteger) deleg;
		[NullAllowed, Export ("deleg", ArgumentSemantic.Copy)]
		Action<nint> Deleg { get; set; }

		// @property (nonatomic) NSInteger counterValue;
		[Export ("counterValue")]
		nint CounterValue { get; set; }

		// @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UiView { get; }

		// @property (readonly, nonatomic, strong) UIViewController * _Nullable viewController;
		[NullAllowed, Export ("viewController", ArgumentSemantic.Strong)]
		UIViewController ViewController { get; }

		// -(void)createSwiftView;
		[Export ("createSwiftView")]
		void CreateSwiftView ();

		// -(void)setCounterWithValue:(NSInteger)value;
		[Export ("setCounterWithValue:")]
		void SetCounterWithValue (nint value);
	}
}
