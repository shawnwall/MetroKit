//
//  MKKeyboardView.h
//  MetroKit
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MKKeyboardView : UIView {
    NSArray *_buttons;
}

@property (nonatomic, assign) UITextField* target;
@property (nonatomic) UIKeyboardType keyboardType;

+ (MKKeyboardView *)sharedInstance;

@end
