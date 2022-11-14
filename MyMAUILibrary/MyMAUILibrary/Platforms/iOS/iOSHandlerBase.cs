using Bindings.SwiftUIToMaui;
using Foundation;
using Microsoft.Maui.Handlers;
using UIKit;

namespace MyMAUILibrary;

public abstract class iOSHandlerBase<TWrapper, TVirtualView, TPlatformView> : ViewHandler<TVirtualView, TPlatformView>
    where TVirtualView : class, IView
    where TPlatformView : UIView
    where TWrapper : NSObject, IUIViewHost, new()
{
    protected TWrapper Wrapper { get; set; }

    protected iOSHandlerBase(IPropertyMapper propertyMapper) : base(propertyMapper) { }
    
    
    // public static IPropertyMapper<TVirtualView, MyHandlerBase<TWrapper, TVirtualView, TPlatformView>> PropertyMapper =
    //     new PropertyMapper<TVirtualView, MyHandlerBase<TWrapper, TVirtualView, TPlatformView>>(ViewHandler.ViewMapper)
    //     {
    //     };
    
    protected override TPlatformView CreatePlatformView() {
        Wrapper = new TWrapper();
        return (TPlatformView)Wrapper.UiView;
    }
}

