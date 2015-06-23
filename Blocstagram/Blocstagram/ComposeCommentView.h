//
//  ComposeCommentView.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/22/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ComposeCommentView;

@protocol ComposeCommentViewDelegate <NSObject>

-(void) commentViewDidPressCommentButton:(ComposeCommentView *)sender;
-(void) commentView:(ComposeCommentView *)sender textDidChange:(NSString *)text;
-(void) commentViewWillStartEditing:(ComposeCommentView *) sender;

@end

@interface ComposeCommentView : UIView

@property (nonatomic, weak) NSObject <ComposeCommentViewDelegate> *delegate;
@property (nonatomic, assign) BOOL isWritingComment; //deterimines weather the user is currently editing a comment.
@property (nonatomic, strong) NSString *text; //containts the text of the comment, and will allow an external controller to set text.

-(void) stopComposingComment;

@end
