//
//  ValuePopoverTableViewController.m
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "ValuePopoverTableViewController.h"
#import "ValueCell.h"

@interface ValuePopoverTableViewController ()

@end

@implementation ValuePopoverTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.values.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  ValueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell" forIndexPath:indexPath];
  
  NSString *value = self.values[indexPath.row];
  cell.valueTypeLabel.text = value;
  
  return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  BOOL rc = NO;
  
  if (![textField.text isEqualToString:@""])
  {
    rc = YES;
    if ([textField isFirstResponder])
    {
      [textField resignFirstResponder];
      NSString *inputValue = textField.text; //+ dataType
    }
  }
  return rc;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  NSString *chosenValue = self.values[indexPath.row];
  [self.delegate valueWasChosen:chosenValue];
  //maybe put in an alert here to input value
}

@end
