#import "PageDialogPlugin.h"
#if __has_include(<page_dialog/page_dialog-Swift.h>)
#import <page_dialog/page_dialog-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "page_dialog-Swift.h"
#endif

@implementation PageDialogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPageDialogPlugin registerWithRegistrar:registrar];
}
@end
