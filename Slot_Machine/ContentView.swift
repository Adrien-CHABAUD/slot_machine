//
//  ContentView.swift
//  Slot_Machine
//
//  Created by Adrien CHABAUD on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var slots = [1, 2, 3]
    
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
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
                
                Spacer()
                
                // Amount of coins
                Text("Coins: \(coins)")
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    CardView(fruitNumber: $slots[0],
                             colorBack: $backgrounds[0])
                    
                    CardView(fruitNumber: $slots[1],
                             colorBack: $backgrounds[1])
                    
                    CardView(fruitNumber: $slots[2],
                             colorBack: $backgrounds[2])
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    // Set the backgrounds back to white
                    // self.backgrounds[0] = Color.white
                    // self.backgrounds[1] = Color.white
                    // self.backgrounds[2] = Color.white
                    
                    self.backgrounds = self.backgrounds.map { _ in
                        Color.white
                    }
                    
                    // Give random numbers to each member of the array
                    self.slots = self.slots.map { _ in
                        Int.random(in: 1...3)
                    }
                    
                    if self.slots[0] == self.slots[1] && self.slots[0] == self.slots[2] {
                        // Won
                        
                        // Update coins
                        self.coins += 10 * 5
                        
                        // Change background color
                        self.backgrounds = self.backgrounds.map { _ in
                            Color.green
                        }
                        
                    } else {
                        // Lost
                        
                        // Update the coins
                        self.coins -= 1
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

//struct slotView: View {
//
//    var fruitNumber: Int
//
//    var body: some View {
//        Image("fruit\(fruitNumber)")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .background(Color.green.opacity(0.3))
//            .cornerRadius(10)
//    }
//}
