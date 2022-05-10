//
//  UIColor+Test.m
//  DarkTest
//
//  Created by fangtingting on 2021/4/16.
//

#import "UIColor+Test.h"

@implementation UIColor (Test)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (UIColor *)namehaha {
    NSLog(@"Test");
    
    return [UIColor purpleColor];
}

+ (UIColor *)Name {
    NSLog(@"FirstName");
    
    return [UIColor orangeColor];
}

@end
