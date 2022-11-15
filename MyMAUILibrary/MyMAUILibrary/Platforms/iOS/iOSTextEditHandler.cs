using Bindings.SwiftUIToMaui;
using Microsoft.Maui.Handlers;
using MyMAUILibrary.Core;
using UIKit;

namespace MyMAUILibrary;

public class TextEditHandler : iOSHandlerBase<MySwiftUIView, TextEditView> {
    public TextEditHandler() : base(PropertyMapper) {
    }
    
    public static IPropertyMapper<TextEditView, TextEditHandler> PropertyMapper =
        new PropertyMapper<TextEditView, TextEditHandler>(ViewHandler.ViewMapper)
        {
            //[nameof(MyView2.Counter)] = MapCounter,
    
        };
    
    protected override UIView CreatePlatformView() {
        base.CreatePlatformView();
        Wrapper = new MySwiftUIView();
        Wrapper.CreateSwiftUIView();
        return Wrapper.UiView;
    }
}