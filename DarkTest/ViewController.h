//
//  ViewController.h
//  DarkTest
//
//  Created by fangtingting on 2021/3/26.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, DYSuperFanOverdueAlertType)
{
    DYSuperFanOverdueAlertSevenType = 0, //7天即将过期弹窗
    DYSuperFanOverdueAlertOneType = 1, //1天即将过期弹窗
};

typedef void (^btnBlock) (id sender);

@interface ViewController : UIViewController
- (void)handleWithBlock:(btnBlock)block;

@end

