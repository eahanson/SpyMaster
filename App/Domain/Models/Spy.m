#import "Spy.h"
#import <objc/objc-class.h>

@interface Spy (Private)
- (id)initWithObject:(NSObject *)newObject selector:(SEL)newSelector;
@end

@implementation Spy

@synthesize object = object_, selectorName = selectorName_;

static NSMutableSet *recordedSpies;

+ (Spy *)onObject:(NSObject *)object selector:(SEL)selector {
    if (!recordedSpies) {
        recordedSpies = [[NSMutableSet alloc] init];
    }
    return [[[Spy alloc] initWithObject:object selector:selector] autorelease];
}

+ (void)recordCallForObject:(NSObject *)object selectorName:(NSString *)selectorName {
    [recordedSpies addObject:[NSArray arrayWithObjects:object, selectorName, nil]];
}

- (id)initWithObject:(NSObject *)object selector:(SEL)selector {
    self.object = [object retain];
    self.selectorName = NSStringFromSelector(selector);
    
    Method originalMethod = class_getInstanceMethod([self.object class], selector);
    Method newMethod = class_getInstanceMethod([Spy class], @selector(spyMethod:));
    method_exchangeImplementations(newMethod, originalMethod);    
    
    return self;
}

- (BOOL)wasCalled {
    NSArray *objectAndSelector = [NSArray arrayWithObjects:self.object, self.selectorName, nil];
    return [recordedSpies containsObject:objectAndSelector];
}

- (void)spyMethod:(id)arg {
    [Spy recordCallForObject:self selectorName:NSStringFromSelector(_cmd)];
}

@end
