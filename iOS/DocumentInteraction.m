//  DocumentInteraction.m
//  DocumentInteraction
//
//  A simple native module utilizing iOS DocumentInteraction methods

#import "DocumentInteraction.h"

@implementation DocumentInteraction
RCT_EXPORT_MODULE()


RCT_EXPORT_METHOD(shareDocument:(NSString *)name )
{
    
    DocumentInteractionManager *myManager = [[DocumentInteractionManager alloc] init];
    [myManager openDocument:name];
}
@end

@implementation DocumentInteractionManager

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *)controller {
    return [[[[UIApplication sharedApplication] delegate] window] rootViewController];
}

- (void)openDocument:(NSString *)name
{
    NSURL *assetUrl = [NSURL fileURLWithPath:name];
  
    if (assetUrl) {
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:assetUrl];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        [self.documentInteractionController presentPreviewAnimated:YES];
    
    }
    
    else {
        RCTLogInfo(@"Invalid URL %@", name);
    }
}

@end
