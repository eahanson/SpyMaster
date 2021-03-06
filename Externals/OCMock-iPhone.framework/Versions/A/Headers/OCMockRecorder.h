//---------------------------------------------------------------------------------------
//  $Id$
//  Copyright (c) 2004-2010 by Mulle Kybernetik. See License file for details.
//---------------------------------------------------------------------------------------

#import <Foundation/Foundation.h>

@interface OCMockRecorder : NSProxy 
{
	id				signatureResolver;
	NSInvocation	*recordedInvocation;
	NSMutableArray	*invocationHandlers;
}

- (id)initWithSignatureResolver:(id)anObject;

- (BOOL)matchesInvocation:(NSInvocation *)anInvocation;
- (void)releaseInvocation;

- (id)andReturn:(id)anObject;
- (id)andReturnValue:(NSValue *)aValue;
- (id)andThrow:(NSException *)anException;
- (id)andPost:(NSNotification *)aNotification;
- (id)andCall:(SEL)selector onObject:(id)anObject;
#ifdef MAC_OS_X_VERSION_10_6
- (id)andDo:(void (^)(NSInvocation *))block; 
#endif

- (NSArray *)invocationHandlers;

@end
