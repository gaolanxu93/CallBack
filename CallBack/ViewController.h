//
//  ViewController.h
//  CallBack
//
//  Created by LiBinggen on 15/9/6.
//  Copyright (c) 2015年 qingqing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIInterface.h"
#import "APIParamSourceInterface.h"
#import "APICallbackInterface.h"

@interface ViewController : UIViewController<APIParamSourceInterface,APICallbackInterface>

@property (nonatomic, weak) id<APIInterface> hotAPIHandel;
@property (nonatomic, weak) id<APIInterface> latestAPIHandel;
@end

