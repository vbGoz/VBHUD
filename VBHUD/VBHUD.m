//
//  VBHUD.m
//  VBHUD
//
//  Created by Vibhor Goyal on 2/5/14.
//  Copyright (c) 2014 Vibhor Goyal. All rights reserved.
//

#import "VBHUD.h"

@interface VBHUD ()

@property (weak, nonatomic) IBOutlet UIView *hudView;

@end

@implementation VBHUD

#pragma mark - Singleton
+ (VBHUD *)sharedVBHUD
{
    static dispatch_once_t pred;
    
    static VBHUD *_sharedVBHUD = nil;
    
    dispatch_once(&pred, ^{
        _sharedVBHUD = [[VBHUD alloc] init];
    });
    
    return _sharedVBHUD;
}

#pragma mark -
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    self.view.frame = window.frame;
    self.hudView.layer.cornerRadius = 10;
    self.hudView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI controls
- (void)show:(id)sender
{
    NSString *senderName = @"unknown";
    if (sender)
        NSStringFromClass([sender class]);
    
    NSLog(@"show HUD Sender: %@", senderName);
    
    //Animate and show HUD
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    self.hudView.layer.shouldRasterize = YES;
    self.hudView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    self.view.layer.shouldRasterize = YES;
    self.view.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    
    self.hudView.layer.opacity = 0.5f;
    self.hudView.layer.transform = CATransform3DMakeScale(2.0f, 2.0f, 2.0f);
    
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    [self.view setFrame:CGRectMake(0, 0, screenBounds.size.width, screenBounds.size.height)];
    [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self.view];
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
                         self.hudView.layer.opacity = 1.0f;
                         self.hudView.layer.transform = CATransform3DMakeScale(1, 1, 1);
					 }
					 completion:nil
     ];
}

- (void)hide:(id)sender
{
    NSString *senderName = @"unknown";
    if (sender)
        NSStringFromClass([sender class]);
    
    NSLog(@"hide HUD Sender: %@", senderName);
    
     //Animate and hide HUD
    CATransform3D currentTransform = self.hudView.layer.transform;
    
    CGFloat startRotation = [[self.hudView valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
    CATransform3D rotation = CATransform3DMakeRotation(-startRotation + M_PI * 270.0 / 180.0, 0.0f, 0.0f, 0.0f);
    
    self.hudView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1));
    self.hudView.layer.opacity = 1.0f;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
					 animations:^{
						 self.view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         self.hudView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(2.0f, 2.0f, 2.0f));
                         self.hudView.layer.opacity = 0.0f;
					 }
					 completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
					 }
	 ];
}

@end
