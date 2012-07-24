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

+(MKKeyboardButton*)buttonWithTitle:(NSString*)title value:(NSString*)value {
    MKKeyboardButton *button = [MKKeyboardButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setValue:value];
    //todo: future - handle orientation & iPad
    [button setFrame:CGRectMake(button.frame.origin.x, button.frame.origin.y, 28, 49)];
    return button;
}


+(MKKeyboardButton*)buttonWithTitle:(NSString*)title {
    return [MKKeyboardButton buttonWithTitle:title value:title];
}

+(MKKeyboardButton*)button {
    return [MKKeyboardButton buttonWithTitle:nil];    
}

- (void)setDefaults {
    [self setBackgroundColor:[UIColor darkGrayColor]];    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16.0]];
}

-(void)shift {
    //todo
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
