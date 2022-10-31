#!/bin/zsh

rm ApiDefinitions.cs
rm SwiftMauiBindings/SwiftMauiBindings/ApiDefinitions.cs
rm -r  *.xcarchive
rm -r SwiftMaui.xcframework

cd SwiftMaui

xcodebuild archive \
 -scheme SwiftMaui \
 -archivePath ~/SwiftUI_To_Maui/SwiftMaui-ios.xcarchive \
 -sdk iphoneos \
 SKIP_INSTALL=NO

xcodebuild archive \
 -scheme SwiftMaui \
 -archivePath ~/SwiftUI_To_Maui/SwiftMaui-sim.xcarchive \
 -sdk iphonesimulator \
 SKIP_INSTALL=NO

xcodebuild -create-xcframework \
 -framework ~/SwiftUI_To_Maui/SwiftMaui-sim.xcarchive/Products/Library/Frameworks/SwiftMaui.framework \
 -framework ~/SwiftUI_To_Maui/SwiftMaui-ios.xcarchive/Products/Library/Frameworks/SwiftMaui.framework \
 -output ~/SwiftUI_To_Maui/SwiftMaui.xcframework

cd -

sharpie bind -sdk iphoneos -output ./ -namespace Bindings.SwiftUIToMaui -framework ./SwiftMaui.xcframework/ios-arm64/SwiftMaui.framework

cp ApiDefinitions.cs SwiftMauiBindings/SwiftMauiBindings/