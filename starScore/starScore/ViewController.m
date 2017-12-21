//
//  ViewController.m
//  star
//
//  Created by 周玉 on 2017/2/6.
//  Copyright © 2017年 star. All rights reserved.
//

#import "ViewController.h"
#import "showScoreController.h"
#import "markScoreController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"星星评分";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *showScore = [[UIButton alloc] initWithFrame:CGRectMake(150, 150, 100, 30)];
    [showScore setTitle:@"展示评分" forState:UIControlStateNormal];
    [showScore setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    showScore.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    [showScore addTarget:self action:@selector(showScoreClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showScore];
    
    UIButton *markScore = [[UIButton alloc] initWithFrame:CGRectMake(150, 250, 100, 30)];
    [markScore setTitle:@"去评分" forState:UIControlStateNormal];
    [markScore setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    markScore.backgroundColor = [[UIColor blueColor] colorWithAlphaComponent:0.3];
    [markScore addTarget:self action:@selector(markScoreClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:markScore];

}

//展示评分
- (void)showScoreClick {
    [self.navigationController pushViewController:[[showScoreController alloc] init] animated:YES];
}


// 去评分
- (void)markScoreClick {
    [self.navigationController pushViewController:[[markScoreController alloc] init] animated:YES];
}

@end
