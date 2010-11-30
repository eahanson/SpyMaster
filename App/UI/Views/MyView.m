//
//  MyView.m
//  SpyMaster
//
//  Created by Erik Hanson on 11/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)drawRect:(CGRect)dirtyRect {
    // Drawing code here.
}

@end
