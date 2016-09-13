//
//  ONE.m
//  WZZCustomPresentation
//
//  Created by 王召洲 on 16/9/12.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "ONE.h"
#import "TWO.h"
#import "WZZCustomTransition.h"
@interface ONE ()

@end

@implementation ONE

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 100, 100);
    btn.backgroundColor = [UIColor cyanColor];
    btn.center = CGPointMake(btn.center.x, self.view.center.y);
    [btn setTitle:@"弹出" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnTaped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
-(void)btnTaped:(UIButton *)sender {
    TWO *two = [[TWO alloc]init];
    [self presentViewController:two animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
