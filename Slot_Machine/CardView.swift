//
//  CardView.swift
//  Slot_Machine
//
//  Created by Adrien CHABAUD on 2022-03-08.
//

import SwiftUI

struct CardView: View {
    
    @Binding var fruitNumber:Int
    @Binding var colorBack:Color
    
    var body: some View {
        Image("fruit\(fruitNumber)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(colorBack.opacity(0.5))
            .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(fruitNumber: Binding.constant(2), colorBack: Binding.constant(Color.green))
    }
}
