//
//  ContentView.swift
//  Slot_Machine
//
//  Created by Adrien CHABAUD on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
    @State var slot1 = 1
    @State var slot2 = 2
    @State var slot3 = 3
    
    @State var coins = 1000
    
    var body: some View {
        
        ZStack {
            
            // Background
            Rectangle()
                .foregroundColor(Color(red: 97/255, green: 176/255, blue: 132/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 39/255, green: 87/255, blue: 60/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            
            Spacer()
            
            VStack {
                VStack {
                    Text("Coins")
                    Text(String(coins))
                }.padding(10)
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    slotView(fruitNumber: slot1)
                    slotView(fruitNumber: slot2)
                    slotView(fruitNumber: slot3)
                }.padding()
                
                Spacer()
                
                Button(action: {
                    slot1 = Int.random(in: 1...3)
                    slot2 = Int.random(in: 1...3)
                    slot3 = Int.random(in: 1...3)
                    
                    if slot1 == slot2 && slot1 == slot3 {
                        coins += 1000
                    } else {
                        coins -= 50
                        // Add message if coins equal 0
                    }
                    
                    
                    
                }, label: {
                    Text("SPIN")
                        .fontWeight(.semibold)
                        .frame(width: 200, height: 50)
                        .foregroundColor(.red)
                        .background(Color.white)
                        .cornerRadius(20)
                })

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
    }
}
