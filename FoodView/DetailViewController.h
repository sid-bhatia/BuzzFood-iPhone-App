//
//  DetailViewController.h
//  FoodView
//
//  Created by Julian Ozen on 9/13/14.
//  Copyright (c) 2014 Julian Ozen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@property (strong, nonatomic) NSArray * instruction_queue;

@end

