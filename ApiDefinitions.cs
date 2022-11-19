using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace Bindings.SwiftUIToMaui
{
	// @protocol UIViewHost
	/*
  Check whether adding [Model] to this declaration is appropriate.
  [Model] is used to generate a C# class that implements this protocol,
  and might be useful for protocols that consumers are supposed to implement,
  since consumers can subclass the generated class instead of implementing
  the generated interface. If consumers are not supposed to implement this
  protocol, then [Model] is redundant and will generate code that will never
  be used.
*/[Protocol (Name = "_TtP9SwiftMaui10UIViewHost_")]
	interface UIViewHost
	{
		// @required @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[Abstract]
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UiView { get; }
	}

	// @interface MySwiftUIView : NSObject <UIViewHost>
	[BaseType (typeof(NSObject), Name = "_TtC9SwiftMaui13MySwiftUIView")]
	interface MySwiftUIView : UIViewHost
	{
		// @property (nonatomic) NSInteger counter;
		[Export ("counter")]
		nint Counter { get; set; }

		// @property (nonatomic, strong) UIView * _Nullable itemTemplate;
		[NullAllowed, Export ("itemTemplate", ArgumentSemantic.Strong)]
		UIView ItemTemplate { get; set; }

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

	// @interface MyTextWrapper : NSObject <UIViewHost>
	[BaseType (typeof(NSObject), Name = "_TtC9SwiftMaui13MyTextWrapper")]
	interface MyTextWrapper : UIViewHost
	{
		// @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UiView { get; }
	}

	// @interface TemplatedItemView : NSObject <UIViewHost>
	[BaseType (typeof(NSObject), Name = "_TtC9SwiftMaui17TemplatedItemView")]
	interface TemplatedItemView : UIViewHost
	{
		// @property (nonatomic, strong) UIView * _Nullable itemTemplate;
		[NullAllowed, Export ("itemTemplate", ArgumentSemantic.Strong)]
		UIView ItemTemplate { get; set; }

		// @property (readonly, nonatomic, strong) UIView * _Nullable uiView;
		[NullAllowed, Export ("uiView", ArgumentSemantic.Strong)]
		UIView UiView { get; }
	}
}
