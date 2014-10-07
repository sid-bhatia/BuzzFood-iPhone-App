//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircularTimerView.h"

@interface PageContentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property NSUInteger pageIndex;
@property NSString *type;
@property NSString *productid;
@property NSString *descriptionText;
@property UIImage *imageFile;
@property NSDictionary * data;

@property (nonatomic, strong) CircularTimerView *circularTimerView;

@end
