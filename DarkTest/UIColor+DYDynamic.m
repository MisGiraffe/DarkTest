//
//  UIColor+DYDynamic.m
//  DarkTest
//
//  Created by fangtingting on 2021/4/1.
//

#import "UIColor+DYDynamic.h"
#import <objc/runtime.h>

static void const *DYUIColorLightColor = &DYUIColorLightColor;
static void const *DYUIColorDarkColor = &DYUIColorDarkColor;

@implementation UIColor (DYDynamic)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




+ (UIColor *)darkAndLight:(UIColor *)lightColcor dark:(UIColor *)darkColcor {
    __block UIColor *dyColer = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
            if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
                return lightColcor;
            }
            else {
                return darkColcor;
            }
            
    }];
    dyColer.lightColor = lightColcor;
    dyColer.darkColor = darkColcor;
    return dyColer;
}

- (void)setLightColor:(UIColor *)lightColor {
    objc_setAssociatedObject(self, &DYUIColorLightColor, lightColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)lightColor {
    return objc_getAssociatedObject(self, &DYUIColorLightColor);
}

- (void)setDarkColor:(UIColor *)darkColor {
    objc_setAssociatedObject(self, &DYUIColorDarkColor, darkColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIColor *)darkColor {
    return objc_getAssociatedObject(self, &DYUIColorDarkColor);
}

+ (UIColor *)namehaha {
    NSLog(@"DYnamic");
    
    return [UIColor blueColor];
}

+ (UIColor *)Name {
    NSLog(@"SecondName");
    
    return [UIColor greenColor];
}


+ (UIColor *)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    

    UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
        if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor redColor];
        }
        else {
            return [UIColor greenColor];
        }
    }];
    UIColor *resolvedColor = [dyColor resolvedColorWithTraitCollection:previousTraitCollection];
    
    return resolvedColor;
}


@end
