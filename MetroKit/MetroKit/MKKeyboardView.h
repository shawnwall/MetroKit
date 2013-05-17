//
//  MKKeyboardView.h
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Custom flattened UIKeyboard-like implementation supporting a US keyboard.
 
 @discussion This needs to support orientation changes along with iPhone/iPad 
 size changing.
 */
@interface MKKeyboardView : UIView 
{
    BOOL shift;
}
@property (nonatomic, assign) UITextField* target;
@property (nonatomic) UIKeyboardType keyboardType;

+ (MKKeyboardView *)sharedInstance;

@end
