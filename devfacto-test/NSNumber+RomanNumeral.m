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
    
    NSArray * sortedKeys = [numeralsMap.allKeys sortedArrayUsingComparator: ^(id obj2, id obj1) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableString *numeralString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < sortedKeys.count; i++)
    {
        
        NSNumber * key = sortedKeys[i];
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
