#!/bin/zsh

print_green() {
  printf "\n\e[32m$1\e[m\n"
}

print_yellow() {
  printf "\n\e[33m$1\e[m\n"
}

print_yellow "\n[Clean directories]\n"

rm ApiDefinitions.cs
rm SwiftMauiBindings/SwiftMauiBindings/ApiDefinitions.cs
rm -r  *.xcarchive
rm -r SwiftMaui.xcframework
rm -r  SwiftMauiBindings/SwiftMauiBindings/bin
rm -r  SwiftMauiBindings/SwiftMauiBindings/obj

print_yellow "\n[Archive build]\n"

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

print_yellow "\n[Create xcframework]\n"

xcodebuild -create-xcframework \
 -framework ~/SwiftUI_To_Maui/SwiftMaui-sim.xcarchive/Products/Library/Frameworks/SwiftMaui.framework \
 -framework ~/SwiftUI_To_Maui/SwiftMaui-ios.xcarchive/Products/Library/Frameworks/SwiftMaui.framework \
 -output ~/SwiftUI_To_Maui/SwiftMaui.xcframework

cd -

print_yellow "\n[Generate ApiDefinitions.cs file]\n"

sharpie bind -sdk iphoneos -output ./ -namespace Bindings.SwiftUIToMaui -framework ./SwiftMaui.xcframework/ios-arm64/SwiftMaui.framework

cp ApiDefinitions.cs SwiftMauiBindings/SwiftMauiBindings/

cd SwiftMauiBindings

print_yellow "\n[Build bindings]\n"

dotnet build --no-incremental

print_green "DONE!"