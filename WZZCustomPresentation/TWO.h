//
//  TWO.h
//  WZZCustomPresentation
//
//  Created by 王召洲 on 16/9/12.
//  Copyright © 2016年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TwoViewControllerDelegate <NSObject>

-(void)presentedControllerDismiss;


@end
@interface TWO : UIViewController

@end
