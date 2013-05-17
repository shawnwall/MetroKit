//
//  MKKeyboardButton.m
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "MKKeyboardButton.h"
#import "UIButton+MKAdditions.h"

@implementation MKKeyboardButton

@synthesize value = _value;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDefaults];
    }
    return self;
}

+(MKKeyboardButton*)buttonWithTitle:(NSString*)title value:(NSString*)value
{
    MKKeyboardButton *button = [MKKeyboardButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setValue:value];
    
    //todo: future - handle orientation & iPad
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y, 28, 49)];
    [button.titleLabel setTextAlignment:NSTextAlignmentLeft];
    return button;
}


+(MKKeyboardButton*)buttonWithTitle:(NSString*)title
{
    return [MKKeyboardButton buttonWithTitle:title value:title];
}

+(MKKeyboardButton*)button
{
    return [MKKeyboardButton buttonWithTitle:nil];    
}

- (void)setDefaults {
    [self setBackgroundColor:[UIColor colorWithWhite:0.322 alpha:1.000]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
}

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    else
    {
        [self setBackgroundColor:[UIColor colorWithWhite:0.322 alpha:1.000]];
    }
}

- (void)shift
{
    //todo
}


@end
