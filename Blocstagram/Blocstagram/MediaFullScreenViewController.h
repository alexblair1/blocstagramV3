//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/5/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

//custom initializer (like other view controllers) and will pass it a Media object to display
- (instancetype) initWithMedia:(Media *)media;

- (void) centerScrollView;

@end


