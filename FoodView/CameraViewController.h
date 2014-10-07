//
//  CameraViewController.h
//  FoodView
//
//  Created by Julian Ozen on 9/14/14.
//  Copyright (c) 2014 Julian Ozen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *code;
@property (nonatomic, assign) id delegate;

@end
