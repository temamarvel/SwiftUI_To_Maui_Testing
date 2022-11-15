using Bindings.SwiftUIToMaui;
using Microsoft.Maui.Handlers;
using Microsoft.Maui.Platform;
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

        //if you set properties to viewmodel before return from this method
        //it will be applied to swifyui view
        //because View creation is the next step
        //SO THAT you can set some dotnet properties to non-binding swift propertios on this phase
        //but they won't observe chnges at run-time
        ApplyTemplate();

        return Wrapper.UiView;
    }

    private void ApplyTemplate() {
        if (this.VirtualView.ItemTemplate.CreateContent() is VisualElement visualElement) {
            var handler = visualElement.ToHandler(MauiContext);
            Wrapper.ItemTemplate = handler.PlatformView;
        }
    }
}