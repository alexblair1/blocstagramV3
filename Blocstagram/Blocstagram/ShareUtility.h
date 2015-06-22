//
//  ShareUtility.h
//  Blocstagram
//
//  Created by Stephen Blair on 6/5/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Media.h"

@interface ShareUtility : NSObject

+ (UIActivityViewController *) shareItems:(Media *)thingToShare;

@end
