//
//  VBHUD.h
//  VBHUD
//
//  Created by Vibhor Goyal on 2/5/14.
//  Copyright (c) 2014 Vibhor Goyal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBHUD : UIViewController

+ (VBHUD *)sharedVBHUD;
- (void)show:(id)sender;
- (void)hide:(id)sender;

@end
