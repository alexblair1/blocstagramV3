//
//  CameraViewController.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/22/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CameraViewController;

@protocol CameraViewControllerDelegate <NSObject>

-(void) cameraViewController:(CameraViewController *)cameraViewController didCompleteWithImage:(UIImage *) image;

@end

@interface CameraViewController : UIViewController

@property (nonatomic, weak) NSObject <CameraViewControllerDelegate> *delegate;

@end
