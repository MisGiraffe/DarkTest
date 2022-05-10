//
//  UIImage+DYDynamic.m
//  DarkTest
//
//  Created by fangtingting on 2021/4/1.
//

#import "UIImage+DYDynamic.h"

@implementation UIImage (DYDynamic)

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (UIImage *)imageWithLightImage:(UIImage *)lightImage darkImage:(UIImage *)darkImage {
    if (@available(iOS 13.0, *)) {
        if (!lightImage || !darkImage) {
            return lightImage;
        }
        UITraitCollection *lightTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[
            [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight],
            [UITraitCollection traitCollectionWithDisplayScale:lightImage.scale]
        ]];
        UITraitCollection *darkTraitCollection = [UITraitCollection traitCollectionWithTraitsFromCollections:@[
            [UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark],
            [UITraitCollection traitCollectionWithDisplayScale:darkImage.scale]
        ]];
        
        UIUserInterfaceStyle style = UITraitCollection.currentTraitCollection.userInterfaceStyle;
        
        UITraitCollection *currentTraitCollection = style == UIUserInterfaceStyleDark ? darkTraitCollection : lightTraitCollection;
        
        UIImageAsset *imageAsset = [[UIImageAsset alloc] init];
        [imageAsset registerImage:lightImage withTraitCollection:lightTraitCollection];
        [imageAsset registerImage:darkImage withTraitCollection:darkTraitCollection];
        return [imageAsset imageWithTraitCollection:currentTraitCollection];
    }
    return lightImage;
}

+ (UIImage *)imageWithLightImageURL:(nullable NSString *)lightImageURL darkImageURL:(nullable NSString *)darkImageURL {
    
    if (lightImageURL && darkImageURL) {
        UIImage *imagLight = [self getImageFromURL:lightImageURL];
        UIImage *imagDark = [self getImageFromURL:darkImageURL];
        
        return [self imageWithLightImage:imagLight darkImage:imagDark];
    }
    return nil;
}

// 根据url获取图片
+ (UIImage *)getImageFromURL:(NSString *)fileURL
{
    UIImage *result;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}

@end
