//
//  TWO.m
//  WZZCustomPresentation
//
//  Created by 王召洲 on 16/9/12.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "TWO.h"
#import "WZZCustomTransition.h"

@interface TWO ()<UIViewControllerTransitioningDelegate>

@end

@implementation TWO
-(void)dealloc {
    NSLog(@"two销毁了——————————>");
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
}
// 呈现
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [WZZCustomTransition customTransitionWithType:WZZCustomTransitionTypePresent];
}
// 消失
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [WZZCustomTransition customTransitionWithType: WZZCustomTransitionTypeDismiss];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
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
