//
//  UIImage+DYDynamic.h
//  DarkTest
//
//  Created by fangtingting on 2021/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DYDynamic)

+ (UIImage *)imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage;
+ (UIImage *)imageWithLightImageURL:(nullable NSString *)lightImageURL darkImageURL:(nullable NSString *)darkImageURL;
@end

NS_ASSUME_NONNULL_END
