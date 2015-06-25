//
//  CropImageViewController.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/23/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import "MediaFullScreenViewController.h"
@class CropImageViewController;

@protocol CropImageViewControllerDelegate <NSObject>

- (void) cropControllerFinishedWithImage:(UIImage *)croppedImage;

@end

@interface CropImageViewController : MediaFullScreenViewController

- (instancetype) initWithImage:(UIImage *)sourceImage;

@property (nonatomic, weak) NSObject <CropImageViewControllerDelegate> *delegate;

@end
