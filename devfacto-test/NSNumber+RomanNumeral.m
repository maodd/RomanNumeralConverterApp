//
//  NSNumber+RomanNumeral.m
//  @"CD"
//
//  Created by Frank Mao on 2015-09-30.
//  Copyright © 2015 @"L":. All rights reserved.
//

#import "NSNumber+RomanNumeral.h"

@implementation NSNumber (RomanNumeral)


// ref: http://www.rapidtables.com/convert/number/how-number-to-roman-numerals.htm

- (NSString *)romanNumeral
{
    NSInteger n = [self integerValue];
    NSDictionary *numeralsMap = @{
                             @1000:@"M",
                             @900:@"CM",
                             @500:@"D",
                             @400:@"CD",
                             @100:@"C",
                             @90:@"XC",
                             @50:@"L",
                             @40:@"XL",
                             @10:@"X",
                             @9:@"IX",
                             @5:@"V",
                             @4:@"IV",
                             @1:@"I",
                             
};
    
    // ensure keys are sorted
    NSArray * sortedKeys = [numeralsMap.allKeys sortedArrayUsingSelector:@selector(compare:)];
    
    // reverse
    sortedKeys = [[sortedKeys reverseObjectEnumerator] allObjects];
    
    
    
    // match by value
    NSMutableString *numeralString = [NSMutableString string];
    
    
    for (NSNumber * key in sortedKeys) {

        NSUInteger value = key.integerValue;
        while (n >= value)
        {
            n -= value;
            [numeralString appendString:numeralsMap[key]];
        }
    }
    
    return numeralString;
    
}


@end
