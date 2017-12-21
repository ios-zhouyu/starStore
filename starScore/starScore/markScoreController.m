//
//  markScoreController.m
//  star
//
//  Created by 周玉 on 2017/2/6.
//  Copyright © 2017年 star. All rights reserved.
//

#import "markScoreController.h"
#import "StarEvaluator.h"

@interface markScoreController ()<StarEvaluatorDelegate>
/**
 * 评价星星视图
 */
@property (nonatomic, weak) StarEvaluator *starEvaluator;
@property (nonatomic, weak) UILabel *commentLabel;

@end

@implementation markScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"手势点击或拖动实现评分";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //StarEvaluator星形评价
    StarEvaluator *starEvaluator = [[StarEvaluator alloc] initWithFrame:CGRectMake(80, 180, 120, 30)];
    starEvaluator.delegate = self;
    [self.view addSubview:starEvaluator];
    self.starEvaluator = starEvaluator;
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 175, 60, 30)];
    commentLabel.text = @"评分: 0.0";
    commentLabel.textColor = [UIColor blackColor];
    commentLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:commentLabel];
    self.commentLabel = commentLabel;
}

- (void)starEvaluator:(StarEvaluator *)evaluator currentValue:(float)value {
    self.commentLabel.text = [NSString stringWithFormat:@"评分: %.1f",self.starEvaluator.currentValue];
}


@end
