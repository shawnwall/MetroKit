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

@interface MKKeyboardView (Private)

-(void)keyPressed:(id)sender;

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
        // Initialization code
        [self setBackgroundColor:[UIColor colorWithWhite:0.1 alpha:1.0]];
        
        //special buttons
        //shift / num-modeswitcher
        //backspace
        //"control" to switch types between alpha and numpunc
        //return key

        //default
        [self setKeyboardType:UIKeyboardTypeAlphabet];
    }
    return self;
}

-(void)keyPressed:(id)sender {
    MKKeyboardButton *button = (MKKeyboardButton*)sender;
    //testing
    [self.target setText:[NSString stringWithFormat:@"%@%@", self.target.text, button.value]];
}

-(void)setKeyboardType:(UIKeyboardType)keyboardType {    
    //testing out layout, this code will need redone properly
    CGFloat x = 2;
    CGFloat y = 3;
    CGFloat xSpacing = 32;     
    CGFloat ySpacing = 53;    
    switch (keyboardType) {
        case UIKeyboardTypeAlphabet:
        {        
            NSArray *alpha = [NSArray arrayWithObjects:@"qwertyuiop",
                              @"asdfghjkl",
                              @"zxcvbnm",
                              nil];
            
            int row = 0;
            for (NSString *line in alpha) {
                int buttons = [line length];                
                CGFloat width = (buttons * xSpacing);
                CGFloat start = (320.0 - width) / 2;
                for (int i=0; i< [line length]; i++) {
                    unichar c = [line characterAtIndex:i];
                    MKKeyboardButton *button = [MKKeyboardButton buttonWithTitle:[NSString stringWithFormat:@"%C", c]];
                    [button addTarget:self action:@selector(keyPressed:) forControlEvents:UIControlEventTouchUpInside];
                    [button setFrame:CGRectMake(start+x+(xSpacing*i), y+(row*ySpacing), button.frame.size.width, button.frame.size.height)];        
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
    MKKeyboardButton *space = [MKKeyboardButton buttonWithTitle:@"space" value:@" "];    
    [space addTarget:self action:@selector(keyPressed:) forControlEvents:UIControlEventTouchUpInside];    
    [space.titleLabel setFont:[UIFont systemFontOfSize:15.0]];    
    [space setFrame:CGRectMake(82, y+(3*ySpacing), 156, space.frame.size.height)];
    [self addSubview:space];
    
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
