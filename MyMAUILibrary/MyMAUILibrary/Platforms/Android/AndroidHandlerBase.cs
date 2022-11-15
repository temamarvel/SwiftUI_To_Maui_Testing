using Microsoft.Maui.Handlers;

namespace MyMAUILibrary.Core;

//just for compile and symmetry of the architecture
public abstract class
    AndroidHandlerBase<TVirtualView, TPlatformView> : ViewHandler<TVirtualView, TPlatformView>
    where TVirtualView : class, IView
    where TPlatformView : Android.Views.View {
    protected AndroidHandlerBase(IPropertyMapper mapper, CommandMapper commandMapper = null) : base(mapper, commandMapper) {
    }
}

