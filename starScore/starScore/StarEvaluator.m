//
//  starEvaluator.m
//  StarEvaluator
//
//  Created by 周玉 on 2017/2/6.
//  Copyright © 2017年 star. All rights reserved.
//

#import "StarEvaluator.h"

//星星间距
#define starSpace  5

@interface StarEvaluator ()
/**
 *一个星星+间隙的宽度
 */
@property (nonatomic, assign) CGFloat aWidth;
/**
 *一个星星的宽度
 */
@property (nonatomic, assign) CGFloat aStarWidth;
/**
 *手势所在的点的距离
 */
@property (nonatomic, assign) CGFloat touchX;

@property (nonatomic, strong) NSMutableArray  *fullStarArray;

@end

@implementation StarEvaluator

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.currentValue = 0;
        self.backgroundColor = [UIColor clearColor];
        [self setNeedsDisplay];
    }
    return self;
}

// 外界赋值时,将评分转换成点位置,进而绘制出评分星星
- (void)setCurrentValue:(float)currentValue {
    _currentValue = currentValue;
    self.touchX = currentValue / 5.0 * self.frame.size.width;
    [self setNeedsDisplay];
}

// 手势点击时评分动态变化
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchPoint = [touch locationInView:self];
    
    int t = (int)(touchPoint.x / self.aWidth);
    float f = (touchPoint.x - t * starSpace - t * self.aStarWidth) / self.aStarWidth;
    f = f>1.0?1.0:f;
    self.currentValue = t + f;
    
    self.touchX = touchPoint.x;
    [self setNeedsDisplay];
    
    return YES;
}

// 手势移动是评分动态变化
- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchPoint = [touch locationInView:self];
    
    // 防止越界
    if (touchPoint.x >= self.frame.size.width) {
        touchPoint.x = self.frame.size.width;
    }
    
    if (touchPoint.x <= 0) {
        touchPoint.x = 0;
    }
    
    int t = (int)(touchPoint.x / self.aWidth);
    float f = (touchPoint.x - t * starSpace - t * self.aStarWidth) / self.aStarWidth;
    f = f > 1.0 ? 1.0 : f;
    self.currentValue = t + f;
    
    self.touchX = touchPoint.x;
    [self setNeedsDisplay];
    
    return YES;
}

// 绘制出评分星星
- (void)drawRect:(CGRect)rect {
    
    CGFloat width = (self.bounds.size.width - starSpace * 4) / 5;
    
    self.aStarWidth = width;
    self.aWidth = width + starSpace;

    UIImage *image = [UIImage imageNamed:@"evaStar.png"];
    for (int i = 0; i < 5; i ++) {
        CGRect rect = CGRectMake(i * (width + starSpace), 0, width, width);
        [image drawInRect:rect];
    }
    
    //未评分区间颜色
    [[UIColor lightGrayColor] setFill];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceIn);
    
    //评分区间颜色
    CGRect newRect = CGRectMake(0, 0, self.touchX, rect.size.height);
    [[UIColor redColor] set];
    UIRectFillUsingBlendMode(newRect, kCGBlendModeSourceIn);
    
    if ([self.delegate respondsToSelector:@selector(starEvaluator:currentValue:)]) {
        [self.delegate starEvaluator:self currentValue:self.currentValue];
    }
}

- (NSMutableArray *)fullStarArray {
    if (_fullStarArray == nil) {
        _fullStarArray = [[NSMutableArray alloc] init];
    }
    return _fullStarArray;
}


@end
