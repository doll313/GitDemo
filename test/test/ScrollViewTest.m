//
//  ScrollViewTest.m
//  test
//
//  Created by MengWang on 15/8/2.
//  Copyright (c) 2015年 YukiWang. All rights reserved.
//

#import "ScrollViewTest.h"

@implementation ScrollViewTest

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event{
    if(!self.dragging)
    {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    if(!self.dragging)
    {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}

@end
