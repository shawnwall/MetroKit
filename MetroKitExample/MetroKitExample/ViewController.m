//
//  ViewController.m
//  MetroKitExample
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "ViewController.h"
#import "MKButton.h"
#import "MKKeyboardView.h"
#import "MKTextField.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button;
@synthesize textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setButton:nil];
    [self setTextField:nil];
    [super viewDidUnload];    
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
