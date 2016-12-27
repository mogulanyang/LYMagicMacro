//
//  AppDelegate.m
//  MagicMacroDemo
//
//  Created by 兰洋 on 2016/12/27.
//  Copyright © 2016年 lanyang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TwoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setRootVC];
    
    return YES;
}

// 设置tabbar的根控制器
- (void)setRootVC
{
    _window = [[UIWindow alloc] init];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    
    ViewController *VC = [[ViewController alloc] init];
    VC.tabBarController.tabBar.tintColor = [UIColor blackColor];
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    twoVC.tabBarController.tabBar.tintColor = [UIColor blackColor];

    
    tabBarVC.viewControllers = @[VC, twoVC];
    
    _window.rootViewController = tabBarVC;
    
    [_window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
