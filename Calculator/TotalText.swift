//
//  TotalText.swift
//  Calculator
//
//  Created by Alberto Orrantia on 21/09/23.
//

import SwiftUI

struct TotalText: View {
    var value = "0"
    var body: some View {
        Text (value)
            .padding()
            .font(.system(size: 60))
            .fontWeight(.light)
            .foregroundColor(Color.white)
            .bold()
            .lineLimit(1)
    }
}

struct TotalText_Previews: PreviewProvider {
    static var previews: some View {
        TotalText()
            .background(.black)
    }
}
