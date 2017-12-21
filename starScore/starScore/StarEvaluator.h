//
//  starEvaluator.h
//  StarEvaluator
//
//  Created by 周玉 on 2017/2/6.
//  Copyright © 2017年 star. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarEvaluator;
@protocol StarEvaluatorDelegate <NSObject>

@optional
// 代理方法 动态获取评分
- (void)starEvaluator:(StarEvaluator *)evaluator currentValue:(float)value;

@end

@interface StarEvaluator : UIControl

@property (assign, nonatomic) id<StarEvaluatorDelegate>delegate;

// 当前评分制
@property (nonatomic, assign) float currentValue;
@end
