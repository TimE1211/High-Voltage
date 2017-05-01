//
//  ValuePopoverTableViewController.h
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChosenValueDelegate

- (void)valueWasChosen:(NSString *)chosenValue;

@end

@interface ValuePopoverTableViewController : UITableViewController

@property (nonatomic) NSArray *values;
@property (nonatomic) id<ChosenValueDelegate> delegate;

@end
