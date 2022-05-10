//
//  UITableView+Normal.m
//  UITableView+Normal
//
//  Created by fangtingting on 2021/8/16.
//

#import "UITableView+Normal.h"

@implementation UITableView (Normal)

#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
