//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"
#import "CircularTimerView/CircularTimerView.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.backgroundImageView.image = self.imageFile;

    self.titleLabel.text = self.type;
    
    if ([self.type  isEqual: @"instruction"]){
        
        
        UILabel* text = [[UILabel alloc] initWithFrame:CGRectMake(20, 0.0, self.view.bounds.size.width -20, self.view.bounds.size.height - 20) ];
        text.text = [self.data objectForKey:@"description"];
        text.numberOfLines = 0;
        
        
        [self.view addSubview:text];
        
    }
    else {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                   action:@selector(buttonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
        [button setTitle:@"Start" forState:UIControlStateNormal];
        
        [self.view addSubview:button];
    }
    


}

- (IBAction)buttonPressed:(id)sender {
    /*
     Request
     
     ('/?', MainHandler,),
     /code/?q=
     /time/?q=       &instruction_count=
     /search/?q=
     /start/
     /add/
     /clear/
     */
    
    
    self.circularTimerView =
    [[CircularTimerView alloc] initWithPosition:CGPointMake(80.f, 280.f)
                                         radius:100
                                 internalRadius:50];
    
    // Light gray circle
    self.circularTimerView.backgroundColor = [UIColor whiteColor];
    self.circularTimerView.backgroundFadeColor = nil;
    
    // Circle Fade from green to red
    self.circularTimerView.foregroundColor = [UIColor redColor];
    self.circularTimerView.foregroundFadeColor = [UIColor greenColor];
    self.circularTimerView.direction = CircularTimerViewDirectionClockwise;
    
    // Text fade from green to red
    self.circularTimerView.font = [UIFont systemFontOfSize:22];
    self.circularTimerView.fontColor = [UIColor greenColor];
    self.circularTimerView.fontFadeColor = [UIColor redColor];
    
    // Display seconds - format text here
    self.circularTimerView.frameBlock = ^(CircularTimerView *circularTimerView){
    circularTimerView.text = [NSString stringWithFormat:@"%@", [self.data objectForKey:@"time"]];
    };
    
    // 1 minute timer
    [self.circularTimerView setupCountdown:[[self.data objectForKey:@"time"] intValue]];
    
    
    [self.view addSubview:self.circularTimerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
