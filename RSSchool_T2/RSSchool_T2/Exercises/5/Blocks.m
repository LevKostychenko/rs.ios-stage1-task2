#import "Blocks.h"

@implementation Blocks

- (BlockA)blockA {
    return [^(NSArray *array){
        self.array = array;
    } copy];
}

- (BlockB)blockB {
    return [^(Class class){
        [self handleClass:class];
    } copy];
}

- (void)handleClass:(Class)class {
    NSMutableArray *answer = [NSMutableArray array];

    for (id object in self.array) {
        if ([object isKindOfClass:class]) {
            [answer addObject:object];
        }
    }

    if (class == [NSString class]) {
        self.blockC([answer componentsJoinedByString:@""]);
    } else if (class == [NSNumber class]) {
        self.blockC([answer valueForKeyPath:@"@sum.self"]);
    } else if (class == [NSDate class]) {
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        [dateFormatter setDateFormat:@"dd.MM.yyyy"];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        [answer sortedArrayUsingDescriptors:@[sortDescriptor]];
        self.blockC([dateFormatter stringFromDate:answer.firstObject]);
    }
}

@end

