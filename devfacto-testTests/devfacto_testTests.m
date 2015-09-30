//
//  devfacto_testTests.m
//  devfacto-testTests
//
//  Created by Frank Mao on 2015-09-30.
//  Copyright © 2015 mazoic. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+RomanNumeral.h"

@interface devfacto_testTests : XCTestCase

@end

@implementation devfacto_testTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConvertNSNumberToRomanNumerals {
    
   
    XCTAssertEqualObjects(@"XXXVI", [@36 romanNumeral]);
    
    XCTAssertEqualObjects(@"MMXII", [@2012 romanNumeral]);
    
    XCTAssertEqualObjects(@"MCMXCVI", [@1996 romanNumeral]);
    
}



@end
