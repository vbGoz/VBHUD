//
//  VBViewController.m
//  VBHUDDemo
//
//  Created by Vibhor Goyal on 2/5/14.
//  Copyright (c) 2014 Vibhor Goyal. All rights reserved.
//

#import "VBViewController.h"
#import "VBHUD.h"

@interface VBViewController ()

- (IBAction)demoButtomTapped:(id)sender;

@end

@implementation VBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)demoButtomTapped:(id)sender {
    
    //Show HUD
    [[VBHUD sharedVBHUD] show:self];
    
    //Hide HUD after 3 seconds
    [[VBHUD sharedVBHUD] performSelector:@selector(hide:) withObject:self afterDelay:3.0f];
    
}

@end
