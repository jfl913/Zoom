//
//  ZoomAppDelegate.h
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZoomViewController;

@interface ZoomAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ZoomViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ZoomViewController *viewController;

@end

