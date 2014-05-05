//
//  PushTestAppDelegate.m
//  PushTest
//
//  令牌的作用就是为使公司服务器链接apns的标识,这个令牌请求是需要push证书的
//
#import "PushTestAppDelegate.h"

@implementation PushTestAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //用下面这句话也可以调用push，不过这是在没有- (void)applicationDidBecomeActive:(UIApplication *)application这个方法的情况下
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(confirmationWasHidden:) name:@"UIApplicationDidBecomeActiveNotification" object:nil];
    // 程序入口
    [self.window makeKeyAndVisible];
    return YES;
}

//调用psh，请求获取动态令牌
- (void) confirmationWasHidden: (NSNotification *) notification
{
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:7];
}

//得到令牌
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //deviceToken:所得到的令牌，令牌的作用是公司服务器在链接apns即苹果服务器时需要发送的令牌，所以得到后一般会发送给公司服务器。
    //得到令牌
    NSString *devStr = [NSString stringWithFormat:@"%@",deviceToken];
    NSLog(@"动态令牌%@",devStr);
} 

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error 
{
    //push错误
} 

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    //收到的push消息，userInfo：push里服务器传递的相关信息，这个信息是由公司服务器自己设定的。可以在这里处理一些逻辑
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //它是类里自带的方法,这个方法得说下，很多人都不知道有什么用，它一般在整个应用程序加载时执行，挂起进入后也会执行，所以很多时候都会使用到
    [self confirmationWasHidden:nil];
}


- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
