#import <Cedar-iPhone/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest-iPhone/OCHamcrest.h>
#import <OCMock-iPhone/OCMock.h>

#import "Expect.h"
#import "Spy.h"

SPEC_BEGIN(SpySpec)

describe(@"Spy", ^{
    it(@"should say whether the method was called", ^{
        NSMutableArray *array = [NSMutableArray array];
        Spy *spy = [Spy onObject:array selector:@selector(addObject:)];
        
        [Expect predicateToBeFalse:^BOOL { return [spy wasCalled]; }];
        
        [array addObject:@"one"];
        [Expect predicateToBeTrue:^BOOL { return [spy wasCalled]; }];
    });
    
    it(@"should not mess with other methods on the spied-upon object", ^{
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
        [Spy onObject:array selector:@selector(addObject:)];

        [Expect int:[array count] toEqual:3];
    });
    
    it(@"should not allow an object/selector combo to be spied upon more than once", ^{
        fail(@"NYI");
    });
});

SPEC_END
