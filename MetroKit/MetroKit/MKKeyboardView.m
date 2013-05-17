//
//  MKKeyboardView.m
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import "MKKeyboardView.h"
#import "MKButton.h"
#import "MKKeyboardButton.h"

#define kKeyboardStartX 2.0
#define kKeyboardStartY 3.0
#define kKeyboardSpacingX 32.0
#define kKeyboardSpacingY 53.0

@interface MKKeyboardView (Private)

-(void)keyPressed:(id)sender;
-(void)backspace:(id)sender;
-(void)shift:(id)sender;
-(void)changeMode:(id)sender;
-(void)returnPressed:(id)sender;

@end

@implementation MKKeyboardView

@synthesize target = _target;
@synthesize keyboardType = _keyboardType;

+ (MKKeyboardView *)sharedInstance {
    static MKKeyboardView *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] initWithFrame:CGRectMake(0, 0, 320, 216)];
    });
    
    return _sharedInstance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1.0]];
        //default
        [self setKeyboardType:UIKeyboardTypeAlphabet];
        
        MKKeyboardButton *space = [MKKeyboardButton buttonWithTitle:@"space" value:@" "];
        [space addTarget:self action:@selector(keyPressed:) forControlEvents:UIControlEventTouchUpInside];
        [space.titleLabel setFont:[UIFont fontWithName:@"SourceSansPro-Semibold" size:15]];
        [space setFrame:CGRectMake(82, kKeyboardStartY+(3*kKeyboardSpacingY), 156, space.frame.size.height)];
        [self addSubview:space];
        
        MKKeyboardButton *backspace = [MKKeyboardButton button];
        [backspace addTarget:self action:@selector(backspace:) forControlEvents:UIControlEventTouchUpInside];
        [backspace setFrame:CGRectMake(274, kKeyboardStartY+(2*kKeyboardSpacingY), 44, backspace.frame.size.height)];
        [self addSubview:backspace];
        
        MKKeyboardButton *shift = [MKKeyboardButton button];
        [shift addTarget:self action:@selector(shift:) forControlEvents:UIControlEventTouchUpInside];
        [shift setFrame:CGRectMake(kKeyboardStartX, kKeyboardStartY+(2*kKeyboardSpacingY), 44, shift.frame.size.height)];
        [self addSubview:shift];
        
        MKKeyboardButton *modeKey = [MKKeyboardButton buttonWithTitle:@".?123"];
        [modeKey addTarget:self action:@selector(changeMode:) forControlEvents:UIControlEventTouchUpInside];
        [modeKey.titleLabel setFont:[UIFont fontWithName:@"SourceSansPro-Semibold" size:15]];
        [modeKey setFrame:CGRectMake(kKeyboardStartX, kKeyboardStartY+(3*kKeyboardSpacingY), 76, modeKey.frame.size.height)];
        [self addSubview:modeKey];
        
        MKKeyboardButton *returnKey = [MKKeyboardButton buttonWithTitle:@"done"];
        [returnKey addTarget:self action:@selector(returnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [returnKey.titleLabel setFont:[UIFont fontWithName:@"SourceSansPro-Semibold" size:15]];
        [returnKey setFrame:CGRectMake(242, kKeyboardStartY+(3*kKeyboardSpacingY), 76, returnKey.frame.size.height)];
        [self addSubview:returnKey];
    }
    return self;
}

-(void)keyPressed:(id)sender {
    MKKeyboardButton *button = (MKKeyboardButton*)sender;
    //testing
    [self.target setText:[NSString stringWithFormat:@"%@%@", self.target.text, button.value]];
    if (shiftOn)
    {
        [self deShift];
    }
}

-(void)backspace:(id)sender {
    if ([self.target.text length]) {
        [self.target setText:[self.target.text substringToIndex:[self.target.text length]-1]];
    }
}

- (void)deShift
{
    for (MKKeyboardButton *button in self.subviews)
    {
        button.titleLabel.text = button.titleLabel.text.lowercaseString;
        button.value = button.value.lowercaseString;
        shiftOn = NO;
    }
}

-(void)shift:(id)sender {
    NSLog(@"shift is called");
    NSCharacterSet *set = [NSCharacterSet uppercaseLetterCharacterSet];
    for (MKKeyboardButton *button in self.subviews)
    {
        if ([button.titleLabel.text rangeOfCharacterFromSet:set].location == NSNotFound)
        {
            if (![button.titleLabel.text isEqualToString:@"space"] && ![button.titleLabel.text isEqualToString:@"return"])
            {
                
                button.titleLabel.text = button.titleLabel.text.uppercaseString;
                button.value = button.value.uppercaseString;
                button.titleLabel.textAlignment = NSTextAlignmentLeft;
                shiftOn = YES;
            }
            
        }
        else
        {
            if (![button.titleLabel.text isEqualToString:@"SPACE"] && ![button.titleLabel.text isEqualToString:@"RETURN"])
            {
                button.titleLabel.text = button.titleLabel.text.lowercaseString;
                button.value = button.value.lowercaseString;
                shiftOn = NO;
            }
        }
    }
}

-(void)changeMode:(id)sender {
    //todo
}

-(void)returnPressed:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressedDone" object:self.target];
}

-(void)setTarget:(UITextField *)target {
    _target = target;
    [self setKeyboardType:target.keyboardType];
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType {
    _keyboardType = keyboardType;
    [self setNeedsLayout];
}

-(void)layoutSubviews {
    //testing out layout, this code will need redone properly
    switch (self.keyboardType) {
        case UIKeyboardTypeAlphabet:
        {
            NSArray *alpha = [NSArray arrayWithObjects:@"qwertyuiop",
                              @"asdfghjkl",
                              @"zxcvbnm",
                              nil];
            
            int row = 0;
            for (NSString *line in alpha) {
                int buttons = [line length];
                CGFloat width = (buttons * kKeyboardSpacingX);
                CGFloat start = (320.0 - width) / 2;
                for (int i=0; i< [line length]; i++) {
                    unichar c = [line characterAtIndex:i];
                    MKKeyboardButton *button = [MKKeyboardButton buttonWithTitle:[NSString stringWithFormat:@"%C", c]];
                    [button.titleLabel setFont:[UIFont fontWithName:@"SourceSansPro-Semibold" size:16]];
                    [button addTarget:self action:@selector(keyPressed:) forControlEvents:UIControlEventTouchUpInside];
                    [button setFrame:CGRectMake(start+kKeyboardStartX+(kKeyboardSpacingX*i), kKeyboardStartY+(row*kKeyboardSpacingY), 28, 49)];
                    [self addSubview:button];
                }
                row++;
            }
            
        }
        case UIKeyboardTypeNumbersAndPunctuation:
        {
            break;
        }
        default:
            break;
    }
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
