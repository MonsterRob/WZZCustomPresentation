//
//  WZZCustomTransition.m
//  WZZCustomPresentation
//
//  Created by 王召洲 on 16/9/12.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import "WZZCustomTransition.h"

@interface WZZCustomTransition ()
{
    WZZCustomTrasitionType _type;
}

@end
@implementation WZZCustomTransition

-(instancetype)initCustomTrasitionWithType:(WZZCustomTrasitionType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}
+(instancetype)customTransitionWithType:(WZZCustomTrasitionType)type {
    return [[self alloc]initCustomTrasitionWithType:type];
}
// 系统会将过渡上下文传入 对上下文进行操作
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    switch (_type) {
        case WZZCustomTransitionTypePresent:
            [self presentTransitionAnimation:transitionContext];
            break;
        case WZZCustomTransitionTypeDismiss:
            [self dismisTrasitionAnimation:transitionContext];
            break;
            
        default:
            break;
    }
}
// 过渡时长
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _type == WZZCustomTransitionTypePresent ? 0.3:0.15;
}
// 呈现
-(void)presentTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    // 获取前后控制器
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 获取前视图快照 对快照进行操作
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.tag = 1;
    tempView.frame = fromVC.view.frame;
    fromVC.view.hidden = YES;
    
    // 获取过渡上下文的视图容器
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:tempView];
    [containerView addSubview:toVC.view];
    
    // 设置后视图的初始大小位置 居中 大小为屏幕一半
    toVC.view.frame = CGRectMake(0, 0, 100, 100);
    toVC.view.center = CGPointMake(toVC.view.center.x, containerView.center.y);// 在这个位置放置一个按钮 点击弹出
    NSLog(@"frame --->%@",NSStringFromCGRect(containerView.frame));
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        // 后视图的最终位置大小
        toVC.view.frame = CGRectMake(0, containerView.bounds.size.height*0.25, containerView.bounds.size.width, containerView.bounds.size.width);
        tempView.transform = CGAffineTransformMakeScale(0.9, 0.9);// 向后缩小的效果
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];// 必须
    }];
    
}
// 消失
-(void)dismisTrasitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView=[transitionContext containerView];
    
    UIView *tempView = [containerView viewWithTag:1];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromVC.view.frame =CGRectMake(0, 0, 100, 100);
        fromVC.view.center = CGPointMake(50, containerView.center.y);
        
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
        toVC.view.hidden = NO;
        [tempView removeFromSuperview];
    }];
    
}
@end
