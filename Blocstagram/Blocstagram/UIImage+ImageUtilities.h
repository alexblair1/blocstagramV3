//
//  UIImage+ImageUtilities.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/23/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ImageUtilities)

- (UIImage *) imageWithFixedOrientation;
- (UIImage *) imageResizedToMatchAspectRatioOfSize:(CGSize) size;
- (UIImage *) imageCroppedToRect:(CGRect)cropRect;

@end
