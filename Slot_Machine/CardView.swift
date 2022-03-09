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
    
    private let transition: AnyTransition = AnyTransition.move(edge: .bottom)
    
    var body: some View {
        VStack {
            if fruitNumber == 1 {
                Image("fruit\(fruitNumber)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            } else if fruitNumber == 2{
                Image("fruit\(fruitNumber)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            } else {
                Image("fruit\(fruitNumber)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .transition(transition)
            }
        }
        .background(colorBack.opacity(0.5))
        .cornerRadius(10)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(fruitNumber: Binding.constant(2), colorBack: Binding.constant(Color.green))
    }
}

