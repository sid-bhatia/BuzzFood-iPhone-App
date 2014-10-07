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

@property UIButton *button;

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

    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
    

    self.titleLabel.text = @"";
    
    if ([self.type  isEqual: @"instruction"]){
        self.backgroundImageView.image = self.imageFile;
        self.backgroundImageView.layer.cornerRadius = 100;
        
        
        
        UILabel* text = [[UILabel alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height- 300, self.view.bounds.size.width -40, self.view.bounds.size.height) ];
//        text.text = [self.data objectForKey:@"description"];
        text.text = @"Stir and enjoy";
        text.numberOfLines = 0;
        [text sizeToFit];
        [text setTextColor:[UIColor whiteColor]];
        text.frame = CGRectMake(20, self.view.bounds.size.height- text.frame.size.height -100 , self.view.bounds.size.width, text.frame.size.height);
        
        
        self.backgroundImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        
    
        [self.view addSubview:text];
        [self.view bringSubviewToFront:text];
        
    }
    else {
        _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_button addTarget:self
                   action:@selector(buttonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(0.0, self.view.bounds.size.height - 200, self.view.bounds.size.width, 100.0);
        [_button setBackgroundColor:[UIColor greenColor]];
        [_button setTitle:@"Start" forState:UIControlStateNormal];
        self.backgroundImageView = [[UIImage alloc]init];
        
        [self.view addSubview:_button];
        [self.view bringSubviewToFront:_button];
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
    
    NSString * index = [NSString stringWithFormat: @"%d", (int)self.pageIndex];
    
    NSString * url = @"http://buzzfood-wuhack2014.appspot.com/time?productid=";
    url = [url stringByAppendingString:self.productid];
    url = [url stringByAppendingString:@"&instruction_count="];
    url = [url stringByAppendingString:index];
    
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    

    
    
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * urlData = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    
    if (error == nil)
    {
        // Parse data here
    }
    
    
    
    
    self.circularTimerView =
    [[CircularTimerView alloc] initWithPosition:CGPointMake(80.f, 80.f)
                                         radius:100
                                 internalRadius:96];
    
    // Light gray circle
    self.circularTimerView.backgroundColor = [UIColor whiteColor];
    self.circularTimerView.backgroundFadeColor = [UIColor whiteColor];
    
    // Circle Fade from green to red
    self.circularTimerView.foregroundColor = [UIColor blueColor];
    self.circularTimerView.foregroundFadeColor = [UIColor blueColor];
    self.circularTimerView.direction = CircularTimerViewDirectionClockwise;
    
    // Text fade from green to red
    self.circularTimerView.font = [UIFont systemFontOfSize:22];
    self.circularTimerView.fontColor = [UIColor blueColor];
    self.circularTimerView.fontFadeColor = [UIColor whiteColor];
    
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
