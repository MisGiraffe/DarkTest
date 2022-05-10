//
//  ViewController.m
//  DarkTest
//
//  Created by fangtingting on 2021/3/26.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "UIColor+DYDynamic.h"
#import "UIImage+DYDynamic.h"
#import "CALayerColor.h"
#import <DYCaidSDK/DYCaid.h>
@interface ViewController ()

@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIButton *buttonTest;
@property (nonatomic, strong) UIImageView *imageIcon;
@property (nonatomic, strong) UIImageView *dynamicImage;
@property (nonatomic, strong) UIImageView *downloadImage;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, strong) CALayerColor *layerColor;
@property (nonatomic, weak) UIImageView * bgImageView;

@property (nonatomic, assign) DYSuperFanOverdueAlertType overdueAlertType;
@property (nonatomic, strong) UITableView *tableView;
@end

static char staticString;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dym_motorcade_summon_bg"]];
    [self.view addSubview:bgImageView];
    self.bgImageView = bgImageView;
    [self initViews];
}


- (void)initViews {
    //    NSLog(@"%@",[DYCaid getCAID]);
    //    // Do any additional setup after loading the view.
    //    UIColor *dyColer = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
    //        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
    //            return [UIColor redColor];
    //        }
    //        else {
    //            return [UIColor greenColor];
    //        }
    //    }];
    //    self.num = 0;
    //    self.titleLable.backgroundColor = dyColer;
    //
    //    [self.view setBackgroundColor:[UIColor systemBackgroundColor]];
    //    [self.view addSubview:self.titleLable];
    //    [self.view addSubview:self.buttonTest];
    //
    //
    //    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    //    btn.backgroundColor = [UIColor grayColor];
    //    [btn addTarget:self action:@selector(btnn:) forControlEvents:UIControlEventTouchUpInside];
    //    objc_setAssociatedObject(btn, &staticString, @"aaaa", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //    [self.view addSubview:btn];
    //    [self.view addSubview:self.imageIcon];
    //    [self.view addSubview:self.dynamicImage];
    //    [self.view addSubview:self.downloadImage];
    //
    ////    self.view.backgroundColor = [UIColor Name];
    //
    //
    //    self.layer = [CALayer layer];
    //    self.layer.frame = CGRectMake(100, 450, 100, 100);
    //    [self.view.layer addSublayer:self.layer];
    //
    //    self.layer.shadowOpacity = 0.9;
    //
    //
    //    self.layerColor = [[CALayerColor alloc] init];
    //    UIColor *resolvedColor = [self.layerColor getColor];
    //
    //    self.layer.backgroundColor = resolvedColor.CGColor;
    //
    //    self.layer.shadowColor = [UIColor systemBlueColor].CGColor;
    //    //阴影偏移 ->x正 ->-x负 ，y同理
    //    self.layer.shadowOffset = CGSizeMake(10, -10);
    //    //阴影的圆角半径
    //    self.layer.shadowRadius = 10;
    //
    //    self.view.backgroundColor = [UIColor systemBackgroundColor];
    //
    ////    int a = 10;
    ////    void (^block)(void) = ^{
    ////          NSLog(@"a的值 - %d",a);
    ////    };
    ////
    ////    a = 2;
    ////    block();
    //
    //
    //    __block int a = 10;
    //    void (^block)(void) = ^{
    //          NSLog(@"a的值 - %d",a);
    //    };
    //    a = 2;
    //    block();
}




- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    [self.layerColor traitCollectionDidChange:previousTraitCollection];
    
    UIColor *resolvedColor = [self.layerColor getColor];

    self.layer.backgroundColor = resolvedColor.CGColor;
}


- (void)btnn:(UIButton *)btn{
 
    NSString *str = objc_getAssociatedObject(btn, &staticString);
    NSLog(@"%@",str);
    
    if (self.num%2 == 0) {
//        self.view.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
//        [UIApplication sharedApplication].delegate.window.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        [UIApplication sharedApplication].keyWindow.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
        
    }
    else {
//        self.view.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].keyWindow.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
    self.num++;
    
    NSLog(@"num :%d",self.num);
 
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(12, 50, 100, 50)];
        _titleLable.text = @"hahaha";
        [_titleLable setTextColor:[UIColor colorNamed:@"bgColor"]];
    }
    return _titleLable;
}

- (UIImageView *)imageIcon {
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon"]];
        _imageIcon.frame = CGRectMake(30, 300, 30, 30);
    }
    return _imageIcon;
}

- (UIImageView *)dynamicImage {
    if (!_dynamicImage) {
        _dynamicImage = [[UIImageView alloc] initWithImage:[UIImage imageWithLightImage:[UIImage imageNamed:@"aa"] darkImage:[UIImage imageNamed:@"cc"]]];
        _dynamicImage.frame = CGRectMake(30, 400, 40, 40);
    }
    return _dynamicImage;
}

- (UIImageView *)downloadImage {
    if (!_downloadImage) {
        _downloadImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 500, 40, 40)];

        _downloadImage.image = [UIImage imageWithLightImageURL:@"https://sta-op-test.douyucdn.cn/dbmc-admin/2020/10/14/0351816c28470158a8fcbf4956fbdf88.png" darkImageURL:@"https://sta-op-test.douyucdn.cn/dbmc-admin/2020/10/14/249b758f37a8748e7e7ab44c1ad4c757.png"];
    }
    return _downloadImage;
}


//- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
//    [super traitCollectionDidChange:previousTraitCollection];
//
//    if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
//        if (previousTraitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
//            NSLog(@"UIUserInterfaceStyleLight");
//        }
//        else if (previousTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
//            NSLog(@"UIUserInterfaceStyleDark");
//        }
//
//    }
//}

- (UIButton *)buttonTest {
    if (!_buttonTest) {
        _buttonTest = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 50)];
        _buttonTest.backgroundColor = [UIColor darkAndLight:[UIColor redColor] dark:[UIColor orangeColor]];
    }
    return _buttonTest;
}

- (void)handleWithBlock:(btnBlock)block {
    if (block) {
        objc_setAssociatedObject(self, @selector(btnAction:), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    [self.buttonTest addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnAction:(id)sender{
    btnBlock block = objc_getAssociatedObject(self, _cmd);
    
    if (block) {
        block(sender);
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 50, 100)];
        
    }
    return _tableView;
}

@end
