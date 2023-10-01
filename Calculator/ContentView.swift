//
//  ContentView.swift
//  Calculator
//
//  Created by Alberto Orrantia on 07/09/23.


import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case substraction
    case multiplication
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var currentMode = CalculatorMode.notSet
    @State var lastButtonMode = false
    @State var savedNum = 0
    @State var currentValueInt = 0
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "×", color: .orange, action: didPressMathMode, mode: .multiplication)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", color: .orange, action: didPressMathMode, mode: .substraction)
                }
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "+", color: .orange, action: didPressMathMode, mode: .addition)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 150, action: didPressNumber)
                    CalculatorButton(buttonText: "AC", color: .gray, numberColor: .black, action: didPressClear)
                    CalculatorButton(buttonText: "=", color: .orange, action: didPressEqual)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton) {
        if lastButtonMode {
            lastButtonMode = false
            currentValueInt = 0
            
        }
        if let parsedValue = Int("\(currentValueInt)" + button.buttonText) {
            currentValueInt = parsedValue
            updateText()
        } else {
            currentValue = "ERROR!"
            currentValueInt = 0
        }
    }
    
    func didPressMathMode(button: CalculatorButton) {
        currentMode = button.mode
        lastButtonMode = true
        print(currentMode)
    }
    
    func didPressEqual(button: CalculatorButton) {
        if currentMode == .notSet || lastButtonMode {
            return
        }
        if currentMode == .addition {
            savedNum += currentValueInt
        } else if currentMode == .substraction {
            savedNum -= currentValueInt
        } else if currentMode == .multiplication {
            savedNum *= currentValueInt
        }
        currentValueInt = savedNum
        updateText()
        lastButtonMode = true

    }
    
    func didPressClear(button: CalculatorButton) {
      currentValue = "0"
      currentMode = .notSet
      lastButtonMode = false
      savedNum = 0
      currentValueInt = 0
    }
    
    func updateText() {
        if currentMode == .notSet {
            savedNum = currentValueInt
        }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let num = NSNumber(value: currentValueInt)
        currentValue = numberFormatter.string(from: num) ?? "Error"
    }
}
//print ("")

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
