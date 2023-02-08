//
//  ContentView.swift
//  test
//
//  Created by Joey Davenport on 2/5/23.
//

import SwiftUI

struct ContentView: View {
    
    // View state controller variables
    @State var background:String = "Splashscreen"
    
    

    
    var body: some View {
        
        ZStack {
            TabView {
                CalView(weight: 0, age: 0)
                    .tabItem(){
                        Text("Calories")
                        Image("Kcal")
                    }
                
                ScheduleView()
                    .tabItem() {
                        Text("Schedule")
                        Image("Schedule")
                    }
                LiftView()
                    .tabItem() {
                        Text("Lift")
                        Image("Lift")
                    }
                ProgressView()
                    .tabItem() {
                        Text("Progress")
                        Image("Progress")
                    }
            }
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewInterfaceOrientation(.portrait)
            
    }
}

