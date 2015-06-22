//
//  ShareUtility.m
//  Blocstagram
//
//  Created by Stephen Blair on 6/5/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import "ShareUtility.h"

@implementation ShareUtility

+ (UIActivityViewController *) shareItems:(Media *)thingToShare {
    NSMutableArray *itemsToShare = [NSMutableArray array];
    
    if (thingToShare.caption.length > 0) {
        [itemsToShare addObject:thingToShare.caption];
    }
    
    if (thingToShare.image) {
        [itemsToShare addObject:thingToShare.image];
    }
    
    if (itemsToShare.count > 0) {
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
        return activityVC;
    }
    return 0;
}

@end
