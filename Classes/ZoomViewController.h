//
//  ZoomViewController.h
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZoomViewController : UIViewController <UIScrollViewDelegate> {
	UIImageView *image;
    UIScrollView *scrollView;
}

@end

