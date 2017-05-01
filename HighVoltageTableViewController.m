//
//  HighVoltageTableViewController.m
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "HighVoltageTableViewController.h"
#import "ValuePopoverTableViewController.h"
//#import "High Voltage-Swift"

@interface HighVoltageTableViewController () <UIPopoverPresentationControllerDelegate, ChosenValueDelegate>
{
  NSMutableArray *allValues;
  NSMutableArray *remainingValues;
  NSMutableArray *visibleValues;
}
@end

@implementation HighVoltageTableViewController

static NSString * const reuseIdentifier = @"ValueCell";

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Collect 'Em All";
  
  allValues = [[NSMutableArray alloc] init];
  [allValues addObject:@"resistance"];
  [allValues addObject:@"voltage"];
  [allValues addObject:@"current"];
  [allValues addObject:@"power"];
  remainingValues = [[NSMutableArray alloc] init];
  [remainingValues addObjectsFromArray:allValues];
  
  visibleValues = [[NSMutableArray alloc] init];
  
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"ValuePopoverSegue"])
  {
    ValuePopoverTableViewController *ValuePopVC = [segue destinationViewController];
    ValuePopVC.values = remainingValues;
    ValuePopVC.popoverPresentationController.delegate = self;
    ValuePopVC.delegate = self;
    CGFloat contentHeight = 44.0f * remainingValues.count;
    ValuePopVC.preferredContentSize = CGSizeMake(200.0f, contentHeight);
  }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
  return UIModalPresentationNone;
}

- (void)valueWasChosen:(NSString *)chosenValue
{
  [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  [visibleValues addObject:chosenValue];
  [remainingValues removeObject:chosenValue];
  if (remainingValues.count == 2)
  {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [visibleValues addObjectsFromArray:remainingValues];
    [remainingValues removeAllObjects];
    brainstuff here;
  }
  [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return visibleValues.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
  
  NSString *ValueType = visibleValues[indexPath.item];
  
  cell.textLabel.text = ValueType;
  cell.detailTextLabel.text = @"";
  
  return cell;
}

@end
