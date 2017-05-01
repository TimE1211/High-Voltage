//
//  ValueCell.h
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *valueTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputValueTextField;
@end
