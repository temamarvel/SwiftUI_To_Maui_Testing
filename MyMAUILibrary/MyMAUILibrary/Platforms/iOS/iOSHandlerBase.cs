using Bindings.SwiftUIToMaui;
using Foundation;
using Microsoft.Maui.Handlers;
using UIKit;

namespace MyMAUILibrary.Core;

public abstract class iOSHandlerBase<TWrapper, TVirtualView> : ViewHandler<TVirtualView, UIView>
    where TVirtualView : class, IView
    where TWrapper : NSObject, IUIViewHost, new()
{
    protected TWrapper Wrapper { get; set; }

    protected iOSHandlerBase(IPropertyMapper propertyMapper) : base(propertyMapper) { }

    protected override UIView CreatePlatformView() {
        Wrapper = new TWrapper();
        return Wrapper.UiView;
    }
    
    protected override void DisconnectHandler(UIView platformView) {
        platformView.Dispose();
        base.DisconnectHandler(platformView);
    }
}

