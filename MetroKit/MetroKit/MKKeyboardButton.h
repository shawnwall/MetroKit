//
//  MKKeyboardButton.h
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MKKeyboardButtonModeNormal = 0,
    MKKeyboardButtonModeCapitalized  
} MKKeyboardButtonMode;

/**
 Flattened keyboard button with square edges used by MKKeyboardView.
 */
@interface MKKeyboardButton : UIButton

@property (nonatomic, strong) NSString* value;

+(MKKeyboardButton*)buttonWithTitle:(NSString*)title value:(NSString*)value;
+(MKKeyboardButton*)buttonWithTitle:(NSString*)title;
+(MKKeyboardButton*)button;

-(void)shift;

@end
