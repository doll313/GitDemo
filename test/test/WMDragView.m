//
//  WMDragView.m
//  test
//
//  Created by MengWang on 15/9/11.
//  Copyright (c) 2015年 YukiWang. All rights reserved.
//

#import "WMDragView.h"

@interface WMDragView () {
    
}
@property(nonatomic, unsafe_unretained)CGFloat currentScale;
@end

@implementation WMDragView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor yellowColor];
        
        UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchView:)];
        [self addGestureRecognizer:pinchGesture];
        
        UIRotationGestureRecognizer *rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(moveView:)];
        [self addGestureRecognizer:rotateGesture];

    }
    return self;
}

- (void)pinchView:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        self.currentScale = gesture.scale;
    }else if(gesture.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f){
        gesture.scale = self.currentScale;
    }
    if (gesture.scale != NAN && gesture.scale != 0.0) {
        gesture.view.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
    }
}

- (void)moveView:(UIRotationGestureRecognizer *)gesture {
    
}

@end
