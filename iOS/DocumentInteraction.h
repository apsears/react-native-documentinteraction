//  DocumentInteraction.h
//  DocumentInteraction
//
//  A simple native module utilizing iOS DocumentInteraction methods

#import <Foundation/Foundation.h>
#import  "RCTBridgeModule.h"
#import  "RCTLog.h"
#import  <UIKit/UIKit.h>
#import "RCTUtils.h"


// This class is exposed to React.
@interface DocumentInteraction : NSObject <RCTBridgeModule>

@end

// Manager acts as delegate.  This class doesn't need to be exposed to React.
@interface DocumentInteractionManager : UIViewController <UIDocumentInteractionControllerDelegate>

@property (nonatomic, retain) UIDocumentInteractionController *documentInteractionController;

- (void)openDocument:(NSString *)name;
- (UIViewController *) documentInteractionControllerViewControllerForPreview:(nonnull UIDocumentInteractionController *)controller;

@end
