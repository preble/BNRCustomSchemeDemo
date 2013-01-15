# BNRCustomSchemeDemo

A simple demo of handling custom URL schemes with a Cocoa application.

This application registers for the scheme `bnr-custom`.  Thus when the user opens a URL of the form `bnr-custom://...`, this application will be opened and the URL will be appended to the text field.

## Details

Handling a custom scheme in your application can be boiled down to three basic steps:

1. Add the URL type to the Info.plist.  This can be done using the Project editor in Xcode.
2. Register to receive `kAEGetURL` events in `-applicationDidFinishLaunching:` or similar.
3. Handle the events in method corresponding to the selector you registered.

In this project, the latter two steps can be seen in `AppDelegate.m`.

These steps are documented in the Cocoa Scripting Guide, under [How Cocoa Applications Handle Apple Events](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ScriptableCocoaApplications/SApps_handle_AEs/SAppsHandleAEs.html), although not much detail is provided on how to obtain the actual URL.
