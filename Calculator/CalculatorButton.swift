//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Alberto Orrantia on 21/09/23.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText: String = "1"
    var color: Color = Color(hue: 1.0, saturation: 0.029, brightness: 0.252)
    var numberColor: Color = .white
    var width: CGFloat = 70
    var action: (CalculatorButton) -> Void = {_ in }
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button {
            action(self)
        } label: {
            Text(buttonText)
                .font(.largeTitle)
                .frame(width: width, height: 70, alignment: .center)
                .background(color)
                .foregroundColor(numberColor)
                .clipShape(RoundedRectangle(cornerRadius: 50))
        }

    }

}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
