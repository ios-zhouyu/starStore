//
//  showScoreController.m
//  star
//
//  Created by 周玉 on 2017/2/6.
//  Copyright © 2017年 star. All rights reserved.
//

#import "showScoreController.h"
#import "StarEvaluator.h"

@interface showScoreController ()<StarEvaluatorDelegate,UITextFieldDelegate>
/**
 * 评价
 */
@property (nonatomic, weak) StarEvaluator *starEvaluator;
@property (nonatomic, weak) UILabel *commentLabel;

@property (nonatomic, weak) UITextField *score;
@end

@implementation showScoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"展示评分";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //StarEvaluator星形评价
    StarEvaluator *starEvaluator = [[StarEvaluator alloc] initWithFrame:CGRectMake(80, 180, 120, 30)];
    starEvaluator.delegate=self;
    [self.view addSubview:starEvaluator];
    self.starEvaluator = starEvaluator;
    
    //赋值
    self.starEvaluator.userInteractionEnabled = NO;
    self.starEvaluator.currentValue = 3.3;
    
    UILabel *commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 175, 60, 30)];
    commentLabel.text = @"评分: 0.0";
    commentLabel.textColor = [UIColor blackColor];
    commentLabel.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:commentLabel];
    self.commentLabel = commentLabel;
    
}

//代理回调
- (void)starEvaluator:(StarEvaluator *)evaluator currentValue:(float)value {
    self.commentLabel.text = [NSString stringWithFormat:@"评分: %.1f",self.starEvaluator.currentValue];
}




@end
