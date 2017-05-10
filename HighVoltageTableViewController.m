//
//  HighVoltageTableViewController.m
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//
//http://stackoverflow.com/questions/14495476/how-to-add-dictionary-data-in-to-an-array
//http://stackoverflow.com/questions/8292248/nsdictionary-how-return-the-key-as-a-string

#import "HighVoltageTableViewController.h"
#import "ValuePopoverTableViewController.h"
#import "Brain.h"



@interface HighVoltageTableViewController () <UIPopoverPresentationControllerDelegate, ChosenValueDelegate, BrainDelegate>
{
  NSDictionary *allValues;
  NSMutableArray *remainingValues;
  NSMutableArray *visibleValues;
  NSMutableDictionary *inputValues;
  Brain *brain;
}

@end

@implementation HighVoltageTableViewController


- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Collect 'Em All";
  
  allValues = [[NSDictionary alloc] init];
  allValues = @{@"resistance": @"resistance",
                @"voltage": @"voltage",
                @"current": @"current",
                @"power": @"power"};
  
  remainingValues = [[NSMutableArray alloc] init];
  [remainingValues addObjectsFromArray:[allValues allKeys]];
  
  visibleValues = [[NSMutableArray alloc] init];
  inputValues = [[NSMutableDictionary alloc] init];
  
  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
  
  brain = [Brain new];
  brain.delegate = self;
  
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
    ValuePopVC.preferredContentSize = CGSizeMake(800.0f, contentHeight);
  }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
  return UIModalPresentationNone;
}

- (void)valueWasChosen:(NSString *)chosenValue :(NSNumber *)inputValue
{
  [self.navigationController dismissViewControllerAnimated:YES completion:nil];
  [visibleValues addObject:chosenValue];
  [inputValues  setValue:inputValue forKey:chosenValue];
  [remainingValues removeObject:chosenValue];
  if (remainingValues.count == 2)
  {
    self.navigationItem.rightBarButtonItem.enabled = NO;

    BOOL containsResistance = [visibleValues containsObject:@"resistance"];
    BOOL containsVoltage = [visibleValues containsObject:@"voltage"];
    BOOL containsCurrent = [visibleValues containsObject:@"current"];
    BOOL containsPower = [visibleValues containsObject:@"power"];
    
    if (containsResistance)
    {
      if (containsVoltage)
      {
        [brain calculateUsingResistance:inputValues[@"resistance"] andVoltage:inputValues[@"voltage"]];
      }
      else if (containsCurrent)
      {
        [brain calculateUsingResistance:inputValues[@"resistance"] andCurrent:inputValues[@"current"]];
      }
      else if (containsPower)
      {
        [brain calculateUsingResistance:inputValues[@"resistance"] andPower:inputValues[@"power"]];
      }
    }
    else if (containsVoltage)
    {
      if (containsCurrent)
      {
        [brain calculateUsingVoltage:inputValues[@"voltage"] andCurrent:inputValues[@"current"]];
      }
      else if (containsPower)
      {
        [brain calculateUsingVoltage:inputValues[@"voltage"] andPower:inputValues[@"power"]];
      }
    }
    else if (containsCurrent)
    {
      if (containsPower)
      {
        [brain calculateUsingCurrent:inputValues[@"current"] andPower:inputValues[@"power"]];
      }
    }
    
    [visibleValues addObjectsFromArray:remainingValues];
    [remainingValues removeAllObjects];
  }
  [self.tableView reloadData];
}

- (void) brainDidCalculateMissingValues:(NSNumber *)resistanceInputValue :(NSNumber *)voltageInputValue :(NSNumber *)currentInputValue :(NSNumber *)powerInputValue
{
  [inputValues  setValue:resistanceInputValue forKey:@"resistance"];
  [inputValues  setValue:voltageInputValue forKey:@"voltage"];
  [inputValues  setValue:currentInputValue forKey:@"current"];
  [inputValues  setValue:powerInputValue forKey:@"power"];
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
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell" forIndexPath:indexPath];
  
  NSString *valueType = visibleValues[indexPath.item];
  NSString *inputValue = [inputValues objectForKey:valueType];
  
  cell.textLabel.text = valueType;
  cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", inputValue];
  
  return cell;
}

- (IBAction)resetTapped:(UIBarButtonItem *)sender
{
  brain = nil;
  brain = [Brain new];
  brain.delegate = self;
  
  [remainingValues addObjectsFromArray:[allValues allKeys]];
  [visibleValues removeAllObjects];
  [inputValues removeAllObjects];
  [self.tableView reloadData];
  
  self.navigationItem.rightBarButtonItem.enabled = YES;
}

@end
