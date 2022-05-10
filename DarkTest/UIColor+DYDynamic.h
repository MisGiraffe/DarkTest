//
//  UIColor+DYDynamic.h
//  DarkTest
//
//  Created by fangtingting on 2021/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DYDynamic)

@property (nonatomic, copy) UIColor *lightColor;
@property (nonatomic, copy) UIColor *darkColor;

+ (UIColor *)darkAndLight:(UIColor *)lightColcor dark:(UIColor *)darkColcor;

+ (UIColor *)namehaha;

+ (UIColor *)Name;

+ (UIColor *)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection;
@end

NS_ASSUME_NONNULL_END
