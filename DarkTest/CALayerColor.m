//
//  CALayerColor.m
//  DarkTest
//
//  Created by fangtingting on 2021/4/16.
//

#import "CALayerColor.h"

@interface CALayerColor ()

@property (nonatomic, strong) UIColor *resolvedColor;

@end

@implementation CALayerColor

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.resolvedColor = [UIColor redColor];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
        if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor redColor];
        }
        else {
            return [UIColor greenColor];
        }
    }];
    self.resolvedColor = [dyColor resolvedColorWithTraitCollection:previousTraitCollection];
        
}

- (UIColor *)getColor {
    return self.resolvedColor;
}
@end
