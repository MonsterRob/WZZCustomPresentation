//
//  WZZCustomTransition.h
//  WZZCustomPresentation
//
//  Created by 王召洲 on 16/9/12.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,WZZCustomTrasitionType){
    WZZCustomTransitionTypePresent = 0,
    WZZCustomTransitionTypeDismiss
};
@interface WZZCustomTransition : NSObject<UIViewControllerAnimatedTransitioning>
+(instancetype)customTransitionWithType:(WZZCustomTrasitionType)type;
-(instancetype)initCustomTrasitionWithType:(WZZCustomTrasitionType)type;
@end
