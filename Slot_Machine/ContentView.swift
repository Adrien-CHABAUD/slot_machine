//
//  ContentView.swift
//  Slot_Machine
//
//  Created by Adrien CHABAUD on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
    // Values of the slots (equal the images to put)
    @State private var slots = [1, 2, 3]
    
    // Background of the slots
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    
    // Number of coins held
    @State private var coins = 1000
    
    // Result of the spin
    @State private var win = false
    
    // Amount betted
    private var betAmount = 5
    
    // Show animations
    @State private var show = false
    // Rotate when win
    @State private var rotate = false
    
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
                
                // Name of the "APP" + ASF image
                HStack{
                    
                    starView(win: self.win, rotate: self.rotate)
                    
                    
                    Text("SLOTS")
                        .foregroundColor(.white)
                        .bold()
                    
                    
                    starView(win: self.win, rotate: self.rotate)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                // Amount of coins
                Text("Coins: \(coins)")
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .background(self.win ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                    .cornerRadius(20)
                // To not change the parameters above
                    .animation(.none, value: self.win)
                    .scaleEffect(self.win ? 1.5 : 1)
                    .animation(.spring(response: 0.7, dampingFraction: 0.3), value: self.win)
                
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    CardView(fruitNumber: $slots[0],
                             colorBack: $backgrounds[0])
                        .rotationEffect(Angle.degrees(self.rotate ? 360 : 0))
                        .animation(.linear, value: show)
                    
                    CardView(fruitNumber: $slots[1],
                             colorBack: $backgrounds[1])
                        .rotationEffect(Angle.degrees(self.rotate ? 360 : 0))
                        .animation(.linear, value: show)
                    
                    CardView(fruitNumber: $slots[2],
                             colorBack: $backgrounds[2])
                        .rotationEffect(Angle.degrees(self.rotate ? 360 : 0))
                        .animation(.linear, value: show)
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    // Update the coins
                    self.coins -= self.betAmount * 1
                    
                    // Update the status
                    self.win = false
                    
                    self.show.toggle()
                    
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
                    
                    self.win = isMatch(0, 1, 2)
                    
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
        .animation(.easeOut, value: self.show)
        
    }
    
    // Returns a Bool indicating if the images are the same or not
    func isMatch(_ index1:Int, _ index2:Int, _ index3:Int) -> Bool{
        
        if self.slots[index1] == self.slots[index2] && self.slots[index1] == self.slots[index3] {
            // Win
            
            // Launch rotate animations
            self.rotate.toggle()
            
            // Update coins
            self.coins += 10 * self.betAmount
            
            // Change background colors of the images
            self.backgrounds = self.backgrounds.map { _ in
                Color.green
            }
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct starView: View {
    
    var win: Bool
    var rotate: Bool
    
    var body: some View {
        Image(systemName: "star.leadinghalf.filled")
            .foregroundColor(.yellow)
            .animation(.none, value: win)
            .scaleEffect(win ? 1.2 : 1)
            .rotationEffect(Angle.degrees(rotate ? 360 : 0))
            .animation(.linear, value: win)
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
