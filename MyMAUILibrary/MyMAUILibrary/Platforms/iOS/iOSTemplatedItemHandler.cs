using Bindings.SwiftUIToMaui;
using Microsoft.Maui.Handlers;
using Microsoft.Maui.Platform;
using MyMAUILibrary.Core;
using UIKit;

namespace MyMAUILibrary;

public class TemplatedItemHandler : iOSHandlerBase<TemplatedItemView, TemplatedItem> {
    public TemplatedItemHandler() : base(PropertyMapper) {
    }
    
    public static IPropertyMapper<TemplatedItem, TemplatedItemHandler> PropertyMapper =
        new PropertyMapper<TemplatedItem, TemplatedItemHandler>(ViewHandler.ViewMapper)
        {
            //[nameof(MyView2.Counter)] = MapCounter,
    
        };

    protected override UIView CreatePlatformView() {
        base.CreatePlatformView();
        Wrapper = new TemplatedItemView();

        //if you set properties to viewmodel before return from this method
        //it will be applied to swifyui view
        //because View creation is the next step
        //SO THAT you can set some dotnet properties to non-binding swift propertios on this phase
        //but they won't observe chnges at run-time
        ApplyTemplate();

        Wrapper.
        
        return Wrapper.UiView;
    }

    private void ApplyTemplate() {
        if (this.VirtualView.ItemTemplate.CreateContent() is VisualElement visualElement) {
            var handler = visualElement.ToHandler(MauiContext);
            Wrapper.ItemTemplate = handler.PlatformView;
        }
    }
}