//
//  GameControllerTests.m
//  holla4
//
//  Created by Kruthika Holla on 7/23/15.
//  Copyright (c) 2015 Kruthika Holla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Game.h"

@interface GameControllerTests : XCTestCase

@property (nonatomic) Game *testObject;

@end

@implementation GameControllerTests

- (void)setUp {
    [super setUp];
    self.testObject = [[Game alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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
