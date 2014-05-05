//
//  PushTestAppDelegate.h
//  PushTest
//  --作者：杨升楼
//  --内容：push的代码

#import <UIKit/UIKit.h>

@interface PushTestAppDelegate : NSObject <UIApplicationDelegate> {
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (void) confirmationWasHidden: (NSNotification *) notification;

@end
