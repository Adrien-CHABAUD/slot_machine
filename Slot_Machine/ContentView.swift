//
//  ContentView.swift
//  Slot_Machine
//
//  Created by Adrien CHABAUD on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var slot1 = 1
    @State private var slot2 = 2
    @State private var slot3 = 3
    
    @State private var coins = 1000
    private var betAmount = 5
        
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 97/255, green: 176/255, blue: 132/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 39/255, green: 87/255, blue: 60/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            
            VStack {
                
                Spacer()
                
                // Name of the "APP"
                HStack{
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                    
                    Text("SLOTS")
                        .foregroundColor(.white)
                        .bold()
                    
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                // Amount of coins
                Text("Coins: \(coins)")
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                
                Spacer()
                
                HStack {
                    slotView(fruitNumber: slot1)
                    slotView(fruitNumber: slot2)
                    slotView(fruitNumber: slot3)
                }.padding()
                
                Spacer()
                
                Button(action: {
                    self.slot1 = Int.random(in: 1...3)
                    self.slot2 = Int.random(in: 1...3)
                    self.slot3 = Int.random(in: 1...3)
                    
                    if self.slot1 == self.slot2 && self.slot1 == self.slot3 {
                        self.coins = 10 * 5
                    } else {
                        self.coins = 20 * 5
                        // Add message if coins equal 0
                    }
                    
                }, label: {
                    Text("SPIN")
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.white)
                        .background(Color(red: 88/255, green: 138/255, blue: 88/255))
                        .cornerRadius(5)
                }).shadow(color:.gray, radius: 5, x: 0, y: 0)
                
                Spacer()

            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct slotView: View {
    
    var fruitNumber: Int
    
    var body: some View {
        Image("fruit\(fruitNumber)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.green.opacity(0.3))
            .cornerRadius(10)
    }
}
