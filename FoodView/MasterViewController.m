//
//  MasterViewController.m
//  FoodView
//
//  Created by Julian Ozen on 9/13/14.
//  Copyright (c) 2014 Julian Ozen. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSArray *foods;
@end

@implementation MasterViewController



- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewWillAppear:(BOOL)animated {
    NSData * rawBody = [@"[{\"description\": \"Share a coke with a gwamer\", \"quantity\": 5, \"image\": \"placeholder\", \"instruction_queue\": [{\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Open Film, add water\"}, {\"type\": \"microwave\", \"power\": 9, \"time\": 45}, {\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Mix and Enjoy\"}], \"nutrition_info\": {\"test\": \"null\"}, \"productid\": \"04963406\", \"name\": \"Coke\"}, {\"description\": \"Share a coke with a gwamer\", \"quantity\": 5, \"image\": \"placeholder\", \"instruction_queue\": [{\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Open Film, add water\"}, {\"type\": \"microwave\", \"power\": 9, \"time\": 45}, {\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Mix and Enjoy\"}], \"nutrition_info\": {\"test\": \"null\"}, \"productid\": \"04963406\", \"name\": \"Coke\"}, {\"description\": \"Share a coke with a gwamer\", \"quantity\": 5, \"image\": \"placeholder\", \"instruction_queue\": [{\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Open Film, add water\"}, {\"type\": \"microwave\", \"power\": 9, \"time\": 45}, {\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Mix and Enjoy\"}], \"nutrition_info\": {\"test\": \"null\"}, \"productid\": \"04963406\", \"name\": \"Coke\"}, {\"description\": \"Share a coke with a gwamer\", \"quantity\": 5, \"image\": \"placeholder\", \"instruction_queue\": [{\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Open Film, add water\"}, {\"type\": \"microwave\", \"power\": 9, \"time\": 45}, {\"type\": \"instruction\", \"image_url\": \"dsdksd.gif\", \"description\": \"Mix and Enjoy\"}], \"nutrition_info\": {\"test\": \"null\"}, \"productid\": \"04963406\", \"name\": \"Coke\"}]" dataUsingEncoding:NSUTF8StringEncoding];
    _foods = [[NSArray alloc] init];
    _foods = [NSJSONSerialization JSONObjectWithData:rawBody options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",_foods);
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    //self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = [self.foods objectAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
     
    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;*/
    NSLog(@"test");
    
    
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [[_foods objectAtIndex:indexPath.row] objectForKey:@"name"];
    //cell.detailTextLabel.text = [[foods objectAtIndex:indexPath.row] objectForKey:@"description"];
    //cell.imageView.image = [UIImage imageNamed:[[foods objectAtIndex:indexPath.row] objectForKey:@"image"]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
