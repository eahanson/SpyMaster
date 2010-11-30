#import <Foundation/Foundation.h>


@interface Spy : NSObject 

@property (nonatomic, retain) NSObject *object;
@property (nonatomic, retain) NSString *selectorName;

+ (Spy *)onObject:(NSObject *)object selector:(SEL)selector;
- (BOOL)wasCalled;
@end
