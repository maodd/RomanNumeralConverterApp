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
    NSArray *numeralsMap = @[
                             @{@1000:@"M"},
                             @{@900:@"CM"},
                             @{@500:@"D"},
                             @{@400:@"CD"},
                             @{@100:@"C"},
                             @{@90:@"XC"},
                             @{@50:@"L"},
                             @{@40:@"XL"},
                             @{@10:@"X"},
                             @{@9:@"IX"},
                             @{@5:@"V"},
                             @{@4:@"IV"},
                             @{@1:@"I"},
                             
                             ];
    
    
    NSMutableString *numeralString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < numeralsMap.count; i++)
    {
        
        NSDictionary * map = numeralsMap[i];
        NSUInteger value = [map.allKeys.firstObject integerValue];
        while (n >= value)
        {
            n -= value;
            [numeralString appendString:map.allValues.firstObject];
        }
    }
    
    return numeralString;
    
}


@end
