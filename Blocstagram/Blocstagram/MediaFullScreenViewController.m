//
//  MediaFullScreenViewController.m
//  Blocstagram
//
//  Created by Stephen Blair on 6/5/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import "MediaFullScreenViewController.h"
#import "Media.h"
#import "ShareUtility.h"
#import "MediaTableViewCell.h"

@interface MediaFullScreenViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>


@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
//@property (nonatomic, strong) UITapGestureRecognizer *tapGrayArea;

@property (nonatomic, strong) UIButton *shareButton;


@end

@implementation MediaFullScreenViewController

- (instancetype) initWithMedia:(Media *)media {
    self = [super init];
    
    if (self) {
        self.media = media;
    }
    
    return self;
}

- (void)shareAction:(id)sender{
    NSLog(@"share action");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.scrollView];
    
    // #2
    self.imageView = [UIImageView new];
    self.imageView.image = self.media.image;
    
    [self.scrollView addSubview:self.imageView];
    
    // #3
    self.scrollView.contentSize = self.media.image.size;
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFired:)];
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapFired:)];
    self.doubleTap.numberOfTapsRequired = 2;
    
//    self.tapGrayArea = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGrayAreaFired:)];
//    self.tapGrayArea.cancelsTouchesInView = NO;
//    self.tapGrayArea.delegate = self;
    
    [self.tap requireGestureRecognizerToFail:self.doubleTap];
    
    [self.scrollView addGestureRecognizer:self.tap];
    [self.scrollView addGestureRecognizer:self.doubleTap];
    
    self.shareButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [self.shareButton setTitle:NSLocalizedString(@"Share", @"sharing") forState:UIControlStateNormal];
    [self.shareButton addTarget:self action:@selector(shareItems:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shareButton];
}

//- (void) tapGrayAreaFired:(UITapGestureRecognizer *)sender {
//    if (sender.state == UIGestureRecognizerStateEnded) {
//        CGPoint location = [sender locationInView:nil];
//        CGPoint locationInVC = [self.presentedViewController.view convertPoint:location fromView:self.view.window];
//        
//        if ([self.presentedViewController.view pointInside:locationInVC withEvent:nil] == NO) {
//            
//            if (self.presentingViewController) {
//                NSLog(@"gray area tapped");
//                [self dismissViewControllerAnimated:YES completion:nil];
//            }
//        }
//    }
//    
//    
//}

- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // #4
    self.scrollView.frame = self.view.bounds;
    
    [self recalculateZoomScale];
}

- (void) recalculateZoomScale {
    
    CGSize scrollViewFrameSize = self.scrollView.frame.size;
    CGSize scrollViewContentSize = self.scrollView.contentSize;
    
    scrollViewContentSize.height /= self.scrollView.zoomScale;
    scrollViewContentSize.width /= self.scrollView.zoomScale;
    
    CGFloat scaleWidth = scrollViewFrameSize.width / scrollViewContentSize.width;
    CGFloat scaleHeight = scrollViewFrameSize.height / scrollViewContentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1;
    
    //share button
    self.shareButton.frame = CGRectMake(self.view.bounds.size.width - 60, 20, 40, 20);
    [self.view bringSubviewToFront:self.shareButton];
    }

- (void)shareItems:(UIButton *)sender {
    [self presentViewController:[ShareUtility shareItems:self.media] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Gesture Recognizers

- (void) tapFired:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doubleTapFired:(UITapGestureRecognizer *)sender {
    if (self.scrollView.zoomScale == self.scrollView.minimumZoomScale) {
        // #8
        CGPoint locationPoint = [sender locationInView:self.imageView];
        
        CGSize scrollViewSize = self.scrollView.bounds.size;
        
        CGFloat width = scrollViewSize.width / self.scrollView.maximumZoomScale;
        CGFloat height = scrollViewSize.height / self.scrollView.maximumZoomScale;
        CGFloat x = locationPoint.x - (width / 2);
        CGFloat y = locationPoint.y - (height / 2);
        
        [self.scrollView zoomToRect:CGRectMake(x, y, width, height) animated:YES];
        } else {
            // #9
            [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
            }
}

#pragma mark - center scrollView

- (void)centerScrollView {
    [self.imageView sizeToFit];

    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - CGRectGetWidth(contentsFrame)) / 2;
        } else {
            contentsFrame.origin.x = 0;
            }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - CGRectGetHeight(contentsFrame)) / 2;
        } else {
            contentsFrame.origin.y = 0;
            }
    
    self.imageView.frame = contentsFrame;
}

#pragma mark - UIScrollViewDelegate
// #6
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

// #7
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self centerScrollView];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self centerScrollView];
    
//    [[[[UIApplication sharedApplication] delegate] window] addGestureRecognizer:self.tapGrayArea];
}

//- (void) viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    
//    [[[[UIApplication sharedApplication] delegate] window] removeGestureRecognizer:self.tapGrayArea];
//    
//}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    return YES;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
