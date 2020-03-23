#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    
    NSDictionary *numbers = @{
        @1: @"one", @2: @"two", @3: @"three", @4: @"four", @5: @"five", @6: @"six",
        @7: @"seven", @8: @"eight", @9: @"nine", @10: @"ten", @11: @"eleven", @12: @"twelve",
        @13: @"thirteen", @14: @"fourteen", @16: @"sixteen", @17: @"seventeen",
        @18: @"eighteen", @19: @"nineteen", @20: @"twenty", @21: @"twenty one", @22: @"twenty two",
        @23: @"twenty three", @24: @"twenty four", @25: @"twenty five", @26: @"twenty six",
        @27: @"twenty seven", @28: @"twenty eight", @29: @"twenty nine"
    };
    
    NSInteger intHours = hours.integerValue;
    NSInteger intMinutes = minutes.integerValue;
    
    
    if(intHours < 0 || intHours > 12 || intMinutes < 0 || intMinutes > 59) {
        return @"";
    } else if (intMinutes == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [numbers objectForKey: @(intHours)]];
    } else if (intMinutes == 1) {
        return [NSString stringWithFormat:@"one minute past %@", [numbers objectForKey: @(intHours)]];
    } else if (intMinutes == 59) {
        if (intHours == 12)
        intHours = 0;
        return [NSString stringWithFormat:@"one minute to %@", [numbers objectForKey: @(intHours + 1)]];
    } else if (intMinutes == 15) {
         return [NSString stringWithFormat:@"quarter past %@", [numbers objectForKey: @(intHours)]];
    } else if (intMinutes == 45) {
        if (intHours == 12)
            intHours = 0;
         return [NSString stringWithFormat:@"quarter to %@", [numbers objectForKey: @(intHours + 1)]];
    } else if (intMinutes == 30) {
        return [NSString stringWithFormat:@"half past %@", [numbers objectForKey: @(intHours)]];
    } else if (intMinutes < 30) {
        return [NSString stringWithFormat:@"%@ minutes past %@",
                [numbers objectForKey: @(intMinutes)], [numbers objectForKey: @(intHours)]];
    } else if (intMinutes > 30) {
        if (intHours == 12)
        intHours = 0;
        return [NSString stringWithFormat:@"%@ minutes to %@",
                [numbers objectForKey: @(60 - intMinutes)], [numbers objectForKey: @(intHours + 1)]];
    }
    return @"";
}
@end
