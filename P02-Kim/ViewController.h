//
//  ViewController.h
//  P02-Kim
//
//  Created by ETS Admin on 1/27/17.
//  Copyright © 2017 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *boardImage;
@property (strong, nonatomic) IBOutlet UIImageView *gameOverView;
@property (strong, nonatomic) IBOutlet UIButton *RestartButton;

@property (strong, nonatomic) IBOutlet UIImageView *view11;
@property (strong, nonatomic) IBOutlet UIImageView *view12;
@property (strong, nonatomic) IBOutlet UIImageView *view13;
@property (strong, nonatomic) IBOutlet UIImageView *view14;

@property (strong, nonatomic) IBOutlet UIImageView *view21;
@property (strong, nonatomic) IBOutlet UIImageView *view22;
@property (strong, nonatomic) IBOutlet UIImageView *view23;
@property (strong, nonatomic) IBOutlet UIImageView *view24;

@property (strong, nonatomic) IBOutlet UIImageView *view31;
@property (strong, nonatomic) IBOutlet UIImageView *view32;
@property (strong, nonatomic) IBOutlet UIImageView *view33;
@property (strong, nonatomic) IBOutlet UIImageView *view34;

@property (strong, nonatomic) IBOutlet UIImageView *view41;
@property (strong, nonatomic) IBOutlet UIImageView *view42;
@property (strong, nonatomic) IBOutlet UIImageView *view43;
@property (strong, nonatomic) IBOutlet UIImageView *view44;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *leftSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *upSwipe;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *downSwipe;

@end
