//
//  NSNumber+RomanNumeral.m
//  devfacto-test
//
//  Created by Frank Mao on 2015-09-30.
//  Copyright © 2015 mazoic. All rights reserved.
//

#import "NSNumber+RomanNumeral.h"

@implementation NSNumber (RomanNumeral)


// ref: http://www.rapidtables.com/convert/number/how-number-to-roman-numerals.htm

- (NSString *)romanNumeral
{
    NSInteger n = [self integerValue];
    
    NSArray *numerals = @[@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L", @"XL", @"X", @"IX", @"V", @"IV", @"I"];
    
    NSUInteger valueCount = numerals.count;
    NSUInteger values[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    
    NSMutableString *numeralString = [NSMutableString string];
    
    for (NSUInteger i = 0; i < valueCount; i++)
    {
        while (n >= values[i])
        {
            n -= values[i];
            [numeralString appendString:[numerals objectAtIndex:i]];
        }
    }
    
    return numeralString;
    
}



@end
