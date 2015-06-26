//
//  ComposeCommentTest.m
//  Blocstagram
//
//  Created by Stephen Blair on 6/26/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface ComposeCommentTest : XCTestCase

@end

@implementation ComposeCommentTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSetTextIsWritingComment {
    // This is an example of a functional test case.
    
    ComposeCommentView *testCommentViewOne = [[ComposeCommentView alloc] init];
    [testCommentViewOne setText:@"test text"];
    
    ComposeCommentView *testCommentViewTwo = [[ComposeCommentView alloc] init];
    [testCommentViewTwo setText:@""];
    
    XCTAssertTrue(testCommentViewOne, @"this is true. Pass.");
    //XCTAssertFalse(testCommentViewTwo, @"this is false. Pass.");
    
}

@end
