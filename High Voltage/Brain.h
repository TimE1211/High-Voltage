//
//  Brain.h
//  High Voltage
//
//  Created by Timothy Hang on 5/1/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BrainDelegate

- (void)brainDidCalculateMissingValues:(NSNumber *)resistanceInputValue :(NSNumber *)voltageInputValue :(NSNumber *)currentInputValue :(NSNumber *)powerInputValue;

@end

@interface Brain : NSObject

@property (nonatomic) id<BrainDelegate> delegate;

- (void)calculateUsingResistance:(NSNumber *)resistanceInputValue andVoltage:(NSNumber *)voltageInputValue;
- (void)calculateUsingResistance: (NSNumber *)resistanceInputValue andCurrent:(NSNumber *)currentInputValue;
- (void)calculateUsingResistance: (NSNumber *)resistanceInputValue andPower:(NSNumber *)powerInputValue;
- (void)calculateUsingVoltage: (NSNumber *)voltageInputValue andCurrent:(NSNumber *)currentInputValue;
- (void)calculateUsingVoltage: (NSNumber *)voltageInputValue andPower:(NSNumber *)powerInputValue;
- (void)calculateUsingCurrent: (NSNumber *)currentInputValue andPower:(NSNumber *)powerInputValue;

@end
