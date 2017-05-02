//
//  Brain.m
//  High Voltage
//
//  Created by Timothy Hang on 5/1/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//
//  http://stackoverflow.com/questions/42440264/multiplication-of-2-decimal-number-values-objective-c

#import "Brain.h"

@implementation Brain

- (void)calculateUsingResistance:(NSNumber *)resistanceInputValue andVoltage:(NSNumber *)voltageInputValue
{
  NSNumber *currentInputValue = @(voltageInputValue.doubleValue/resistanceInputValue.doubleValue);
  NSNumber *powerInputValue = @((voltageInputValue.doubleValue * voltageInputValue.doubleValue)/resistanceInputValue.doubleValue);
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];
}

- (void)calculateUsingResistance: (NSNumber *)resistanceInputValue andCurrent:(NSNumber *)currentInputValue
{
  NSNumber *voltageInputValue = @(currentInputValue.doubleValue * resistanceInputValue.doubleValue);
  NSNumber *powerInputValue = @(currentInputValue.doubleValue * currentInputValue.doubleValue * resistanceInputValue.doubleValue);
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];}

- (void)calculateUsingResistance: (NSNumber *)resistanceInputValue andPower:(NSNumber *)powerInputValue
{
  NSNumber *currentInputValue = @(sqrt(powerInputValue.doubleValue/resistanceInputValue.doubleValue));
  NSNumber *voltageInputValue = @(sqrt(resistanceInputValue.doubleValue * powerInputValue.doubleValue));
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];
}

- (void)calculateUsingVoltage: (NSNumber *)voltageInputValue andCurrent:(NSNumber *)currentInputValue
{
  NSNumber *resistanceInputValue = @(voltageInputValue.doubleValue/currentInputValue.doubleValue);
  NSNumber *powerInputValue = @(voltageInputValue.doubleValue * currentInputValue.doubleValue);
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];
}

- (void)calculateUsingVoltage: (NSNumber *)voltageInputValue andPower:(NSNumber *)powerInputValue
{
  NSNumber *currentInputValue = @(powerInputValue.doubleValue/voltageInputValue.doubleValue);
  NSNumber *resistanceInputValue = @((voltageInputValue.doubleValue * voltageInputValue.doubleValue)/powerInputValue.doubleValue);
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];
}

- (void)calculateUsingCurrent: (NSNumber *)currentInputValue andPower:(NSNumber *)powerInputValue
{
  NSNumber *voltageInputValue = @(powerInputValue.doubleValue/currentInputValue.doubleValue);
  NSNumber *resistanceInputValue = @(powerInputValue.doubleValue/(currentInputValue.doubleValue * currentInputValue.doubleValue));
  [self.delegate brainDidCalculateMissingValues:resistanceInputValue :voltageInputValue :currentInputValue :powerInputValue];
}

@end
