//
//  MKButton.m
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "MKButton.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+MKAdditions.h"
#import "UIButton+MKAdditions.h"

#define kMetroButtonSelectedAlpha 0.5
#define kMetroButtonDisabledAlpha 0.8

@implementation MKButton

@synthesize borderColor = _borderColor;

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
    [self setBackgroundColor:[UIColor blackColor]];    
    [self setBorderColor:[UIColor whiteColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize:16.0]];    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[self.borderColor colorWithAlphaComponent:kMetroButtonSelectedAlpha] forState:UIControlStateSelected];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[self.borderColor colorWithAlphaComponent:kMetroButtonDisabledAlpha] forState:UIControlStateDisabled];     
    [self setBackgroundColor:[UIColor blackColor] forState:UIControlStateNormal];    
    [self setBackgroundColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setBackgroundColor:[UIColor blackColor] forState:UIControlStateDisabled];        
    [self.layer setBorderWidth:2.0];
    [self.layer setMasksToBounds:YES];
}

//- (void)setHighlighted:(BOOL)highlighted {
//    [super setHighlighted:highlighted];
//}

//- (void)setEnabled:(BOOL)enabled {
//    [super setEnabled:enabled];
//    [self setNeedsDisplay];
//}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self.layer setBorderColor:[self.borderColor CGColor]];        
}

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (self.selected) {
        [self.layer setBorderColor:[[self.borderColor colorWithAlphaComponent:kMetroButtonSelectedAlpha] CGColor]];
    }
    else {
        [self.layer setBorderColor:[self.borderColor CGColor]];        
    }
    [self setNeedsDisplay];    
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.enabled) {
        if (self.selected) {
            [self.layer setBorderColor:[[self.borderColor colorWithAlphaComponent:kMetroButtonSelectedAlpha] CGColor]];
        }
        else {
            [self.layer setBorderColor:[self.borderColor CGColor]];        
        }   
    }
    else {
        [self.layer setBorderColor:[[self.borderColor colorWithAlphaComponent:kMetroButtonDisabledAlpha] CGColor]];            
    }  
}



@end
