//
//  ZoomViewController.m
//  Zoom
//
//  Created by Fernando Bunn on 10/3/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "ZoomViewController.h"

@implementation ZoomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.delegate = self;
    image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image.JPG"]];
    image.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *doubleClickGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClickImage:)];
    doubleClickGestureRecognizer.numberOfTapsRequired = 2;
    [image addGestureRecognizer:doubleClickGestureRecognizer];
    
    scrollView.contentSize = image.frame.size;
    [scrollView addSubview:image];
    
    scrollView.minimumZoomScale = scrollView.frame.size.width / image.frame.size.width;
    scrollView.maximumZoomScale = 1.0;
    [scrollView setZoomScale:scrollView.minimumZoomScale];
    
    [self.view addSubview:scrollView];
    [scrollView release];

}

- (void)doubleClickImage:(UITapGestureRecognizer *)tapGestureRecognizer
{
    //    [self.galleryViewCellDelegate galleryViewCell:self doubleClickImageWithTapGestureRecognizer:tapGestureRecognizer];
    CGPoint location = [tapGestureRecognizer locationInView:image];
    if (scrollView.zoomScale == scrollView.minimumZoomScale) {
        CGSize scrollViewSize = scrollView.bounds.size;
        CGSize imageSize = image.image.size;
        CGFloat width = scrollViewSize.width / scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / scrollView.maximumZoomScale;
        CGFloat x = location.x - (width / 2.0f);
        if (x < 0) {
            x = 0;
        }
        
        if ((x + width) > imageSize.width) {
            width = imageSize.width - x;
        }
        
        CGFloat y = location.y - (height / 2.0f);
        if (y < 0) {
            y = 0;
        }
        
        if ((y + height) > imageSize.height) {
            height = imageSize.height - y;
        }
        
        CGRect rectToZoomTo = CGRectMake(x, y, width, height);
        [scrollView zoomToRect:rectToZoomTo animated:YES];
    }else if ((scrollView.zoomScale > scrollView.minimumZoomScale) && (scrollView.zoomScale <= scrollView.maximumZoomScale)){
        [scrollView setZoomScale:scrollView.minimumZoomScale animated:YES];
    }
    
}


- (void)viewDidUnload {
	[image release], image = nil;
}

- (CGRect)centeredFrameForScrollView:(UIScrollView *)scroll andUIView:(UIView *)rView {
	CGSize boundsSize = scroll.bounds.size;
    CGRect frameToCenter = rView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width) {
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    }
    else {
        frameToCenter.origin.x = 0;
    }
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height) {
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    }
    else {
        frameToCenter.origin.y = 0;
    }
	
	return frameToCenter;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidZoom:(UIScrollView *)ascrollView {
   image.frame = [self centeredFrameForScrollView:ascrollView andUIView:image];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	return image;
}


- (void)dealloc {
    [super dealloc];
}


@end
