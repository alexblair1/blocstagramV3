//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Stephen Blair on 5/28/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Media, MediaTableViewCell;

@protocol MediaTableViewCellDelegate <NSObject>

-(void) cell:(MediaTableViewCell *)cell didTapImageView:(UIImageView *) imageView;
-(void) cell:(MediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;
- (void) cellDidPressLikeButton:(MediaTableViewCell *)cell;

@end

@interface MediaTableViewCell : UITableViewCell
@property (nonatomic, strong) Media *mediaItem;
@property (nonatomic, weak) id <MediaTableViewCellDelegate> delegate;

+ (CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width;


@end
