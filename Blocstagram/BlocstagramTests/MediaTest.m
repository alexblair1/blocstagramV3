//
//  MediaTest.m
//  Blocstagram
//
//  Created by Stephen Blair on 6/26/15.
//  Copyright (c) 2015 blairgraphix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Media.h"
#import "User.h"

@interface MediaTest : XCTestCase

@end

@implementation MediaTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatBCMEdiaInitializationWorks
{
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"user_has_liked" : @"0",
                                       @"caption" : @{@"text": @"sample" },
                                       @"images" : @{@"standard_resolution":@{@"url":@"http://www.example.com/example.jpg"}} ,
                                       @"user" : @{@"id": @"8675309",
                                                   @"username" : @"d'oh",
                                                   @"full_name" : @"Homer Simpson",
                                                   @"profile_picture" : @"http://www.example.com/example.jpg"},
      
                                       };
    
    
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"The ID number should be equal");
    XCTAssertEqualObjects(testMedia.user.idNumber, sourceDictionary[@"user"][@"id"], @"The username should be equal");
    XCTAssertEqualObjects(testMedia.mediaURL,[NSURL URLWithString: sourceDictionary[@"images"][@"standard_resolution"][@"url"]], @"The full name should be equal");
    XCTAssertEqualObjects(testMedia.caption,sourceDictionary[@"caption"][@"text"], @"The profile picture should be equal");
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
