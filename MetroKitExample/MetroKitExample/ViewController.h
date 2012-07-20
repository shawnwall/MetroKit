//
//  ViewController.h
//  MetroKitExample
//
//  Created by Shawn Wall on 7/19/12.
//  Copyright (c) 2012 TwoTap Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MKButton;
@class MKTextField;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKButton *button;
@property (weak, nonatomic) IBOutlet MKTextField *textField;

@end
