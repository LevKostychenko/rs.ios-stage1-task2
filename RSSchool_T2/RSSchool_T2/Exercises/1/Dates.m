#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSString *dateString = [NSString stringWithFormat: @"%@.%@.%@", day, month, year];
    
    NSDateFormatter *format = [NSDateFormatter new];
    [format setLocale:[NSLocale localeWithLocaleIdentifier:@"ru_RU"]];
    [format setDateFormat: @"d.M.y"];
    
    
    NSDate *date = [format dateFromString: dateString];
    [format setDateFormat: @"d MMMM, EEEE"];
    
    return [format stringFromDate:date] ?: @"Такого дня не существует" ;
}

@end
