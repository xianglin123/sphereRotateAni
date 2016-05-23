//
//  XLimageCVC.h
//  sphereRotateAnimation
//
//  Created by xianglin on 16/5/23.
//  Copyright © 2016年 xianglin. All rights reserved.
//
#import "ViewController.h"
#import "XLSphereView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic,strong)NSMutableArray * picsArr;
@property (nonatomic,strong)NSMutableArray * imagesArr;

@property (strong,nonatomic) XLSphereView * sphereView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showImages];
}

- (void) showImages{
    self.sphereView = [[XLSphereView alloc]initWithFrame:CGRectMake(0, 200, kWidth, kWidth)];
    self.sphereView.center = self.view.center;
    [self.view addSubview:self.sphereView];
    
    for (int i = 0; i < self.picsArr.count; i++) {
        
        [self.sphereView addSubview:self.picsArr[i]];
    
    }


    [self.sphereView setCloudTags:self.picsArr];
    
    _sphereView.backgroundColor = [UIColor clearColor];

}
- (void)showBigImage:(UIButton *)btn {

    CGPoint center = btn.center;
    [UIView animateWithDuration:0.3 animations:^{
        
        btn.frame = CGRectMake(0, 0, 100, 100);
        btn.center = center;

    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            btn.frame = CGRectMake(0, 0, 50, 60);
            btn.center = center;
        }];
        
    }];
    
}

- (UIImage *)getImageByIndex:(NSInteger)index{
    
    NSString *bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:@"images.bundle"];
    NSString *img_path = [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"image%zd.jpg",index]];
    
    return [UIImage imageWithContentsOfFile:img_path];
   
    
}

-(NSMutableArray *)imagesArr{
    if (!_imagesArr) {
        _imagesArr = [NSMutableArray array];
        for (int i = 0; i < self.picsArr.count; i++) {
            [_imagesArr addObject:[self getImageByIndex:i]];
        }
    }
    return _imagesArr;
    
}

-(NSMutableArray *)picsArr{
    if (!_picsArr) {
        _picsArr = [NSMutableArray arrayWithCapacity:20];
        for (int i = 0; i < 26; i++) {
            
            UIImage * bgImage = [self getImageByIndex:i];
            UIButton * btn  = [[UIButton alloc]init];
            btn.tag = i;
            btn.frame = CGRectMake(0, 0, 50, 60);
            [btn addTarget:self action:@selector(showBigImage:) forControlEvents:UIControlEventTouchUpInside];
            [btn setBackgroundImage:bgImage forState:UIControlStateNormal];
            
            [_picsArr addObject:btn];
        }
    }
    return _picsArr;
}

@end
