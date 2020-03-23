#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSInteger previous = 0;
    NSInteger current = 1;

    while (previous * current < number.integerValue) {
        NSInteger next = previous + current;
        previous = current;
        current = next;
    }

    NSArray *answer;
    
    if (previous * current == number.integerValue) {
        answer = @[@(previous), @(current), @(1)];
    }
    else {
        answer = @[@(previous), @(current), @(0)];
    }
    
    return  answer;
}
@end
