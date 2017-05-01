//
//  Brain.swift
//  High Voltage
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

protocol BrainDelegate
{
  func calculatedViaBrain(brain: Brain, didFinishWithResult result: String)
}

class Brain
{
  var delegate: BrainDelegate
  
  init(delegate: BrainDelegate)
  {
    self.delegate = delegate
  }
  
  func calculateProblem(resistance: Double, voltage: Double, current: Double, power: Double)
  {
    var result = ""
//    combo = any 2 values
    switch combo
    {
    case resistance && voltage:
      current = voltage/resistance
      power = (voltage * voltage)/resistance
      result = add results to table view
      
    case resistance && current:
      voltage = current * resistance
      power = current * current * resistance
      result = add results to table view
      
    case resistance && power:
      current = sqrt(power/resistance)
      voltage = sqrt(resistance * power)
      result = add results to table view
      
    case voltage && current:
      resistance = voltage/current
      power = voltage * current
      result = add results to table view
      
    case voltage && power:
      current = power/voltage
      resistance = (voltage * voltage)/power
      result = add results to table view
      
    case current && power:
      voltage = power/current
      resistance = power/(current * current)
      result = add results to table view
      
    default:
      result = "Invalid operation"
    }
    
    delegate.calculatedViaBrain(brain: self, didFinishWithResult: String(result))
  }
}
