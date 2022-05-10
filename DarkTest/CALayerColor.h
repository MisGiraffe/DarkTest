//
//  CALayerColor.h
//  DarkTest
//
//  Created by fangtingting on 2021/4/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayerColor : UIView

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection;

- (UIColor *)getColor;

@end

NS_ASSUME_NONNULL_END
