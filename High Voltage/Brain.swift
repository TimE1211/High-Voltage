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
  
  init(delegate: BrainDelegate)                               //David told me to initialize my Class
  {
    self.delegate = delegate
  }
  
  func calculateProblem(resistance: Double, voltage: Double, current: Double, power: Double)
  {
//    var result = ""
//    var resistance
//    var voltage
//    var current
//    var power
//    switch operatorString
//    {
//    case "+":
//      result = String(operand1 + operand2)
//    case "-":
//      result = String(operand1 - operand2)
//    case "*":
//      result = String(operand1 * operand2)
//    case "/":
//      if operand2 == 0
//      {
//        result = "Cannot / by 0"
//      }
//      else
//      {
//        result = String(operand1 / operand2)
//      }
//    default:
//      result = "Invalid operator pressed"
//    }
    
//    delegate.calculatedViaBrain(brain: self, didFinishWithResult: String(result))
  }
}
