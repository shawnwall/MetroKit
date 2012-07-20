//
//  MKTextField.m
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "MKTextField.h"
#import "MKKeyboardView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MKTextField

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefaults];        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaults];
    }
    return self;
}

- (void)setDefaults {
    [self setFont:[UIFont systemFontOfSize:16.0]];
    [self setBackgroundColor:[UIColor whiteColor]];    
    [self setTextColor:[UIColor blackColor]];
    [self setBorderStyle:UITextBorderStyleNone];
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.leftViewMode = UITextFieldViewModeAlways;   
    [self setInputView:[MKKeyboardView sharedInstance]];    
}

- (BOOL)becomeFirstResponder
{
    BOOL returnValue = [super becomeFirstResponder];
    if (returnValue)
        [[MKKeyboardView sharedInstance] setTarget:self];
    
    return returnValue;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
