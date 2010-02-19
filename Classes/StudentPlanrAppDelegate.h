//
//  StudentPlanrAppDelegate.h
//  StudentPlanr
//
//  Created by Steve Moser on 2/15/10.
//  Copyright MetaEdged 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentPlanrAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
