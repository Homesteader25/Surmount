//
//  CalView.swift
//  test
//
//  Created by Joey Davenport on 2/7/23.
//

import SwiftUI

struct CalView: View {
    
    // Set up for textfield
    @State var weight:Float = 0.0
    @State var numberFormatter = NumberFormatter()
    @State var age:Float = 0.0
    @State var heightCM:Float = 0.0
    @State var BMR:Float = 0.0
    @State var alternate:Float = 0
    
    private let heights: [String] = [
        
        "5'6\"",
        "5'7\"",
        "5'8\"",
        "5'9\"",
        "5'10\"",
        "5'11\"",
        "6'",
        "6'1\"",
        "6'2\"",
        "6'3\"",
        "6'4\"",
        "6'5\"",
        "6'6\"",
        "6'7\'"
    ]
    @State var selectedName:String = "6'4\""
    var Height:String = ""
    
    private let genders: [String] = [
        
        "Male",
        "Female"
       
    ]
    
    @State var selectedGender:String = "Male"
   
    
    
var body: some View {
    ZStack
    {
        VStack(alignment: .center, spacing: 5)
        {
            // Title
            
            Text("Calorie Counter")
                .font(.largeTitle)
                .fontWeight(.bold)
                
                
            
            // Height and Weight HStack
            HStack
            {
                
                    // Height picker
                    Text("Height:")
                        .fontWeight(.bold)
                        Picker("Choose a height", selection: $selectedName) {
                            ForEach(heights, id: \.self) { height in
                                Text(height)
                                }
                            }
                        .pickerStyle(.menu)
                
                // Weight textfield
                Text("Age:")
                    .fontWeight(.bold)
                TextField("", value: $age, formatter: numberFormatter)
                    .background(Color(.systemFill))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 10)
                    .frame(width: 50, height: 10, alignment: .center)
                    .multilineTextAlignment(.center)

                        
            }// Weight and Height HStack end
            
            
        
            // Age and Gender HStack
            HStack
            {
                    // Gender picker
                        Text("Gender:")
                            .fontWeight(.bold)
                            Picker("Choose a Gender", selection: $selectedGender) {
                                ForEach(genders, id: \.self) { gender in
                                    Text(gender)
                                }
                            }
                            .pickerStyle(.menu)
                        
                    // Age textfield
                    Text("Weight:")
                        .fontWeight(.bold)
                    TextField("", value: $weight, formatter: numberFormatter)
                        .background(Color(.systemFill))
                        .cornerRadius(10)
                        .shadow(color: .gray, radius: 10)
                        .frame(width: 50, height: 10, alignment: .center)
                        .multilineTextAlignment(.center)
            }//Age and Gender HStack end
            Spacer()
            


                
        }
        .frame(width: 390, height: 200, alignment: .center)
        .position(x: 200, y: 200)// VStack
        
        Spacer()
        
        
        VStack
        {
            VStack{
                

                Text("Lose .5lbs Per Week: \(BMR - alternate, specifier: "%.0f")")
                    .font(.title)
                    .padding(.all)
                    
                Text("Maintenance Calories: \(BMR, specifier: "%.0f")")
                    .font(.title)
                    .padding(.all)
                    
                Text("Gain .5lbs Per Week: \(BMR + alternate, specifier: "%.0f")")
                    .font(.title)
                    .padding(.all)
                    
                
            }
            
            
            Button("Calculate") {
                switch selectedName  {
                    
                case "5'6\"":
                    heightCM = 167.64
                case "5'7\"":
                    heightCM = 170.18
                case "5'8\"":
                    heightCM = 172.72
                case "5'9\"":
                    heightCM = 175.26
                case "5'10\"":
                    heightCM = 177.80
                case "5'11\"":
                    heightCM = 180.34
                case "6'":
                    heightCM = 182.88
                case "6'1\"":
                    heightCM = 185.42
                case "6'2\"":
                    heightCM = 187.96
                case "6'3\"":
                    heightCM = 190.50
                case "6'4\"":
                    heightCM = 193.04
                case "6'5\"":
                    heightCM = 195.58
                case "6'6\"":
                    heightCM = 198.12
                case "6'7\"":
                    heightCM = 200.66
                
                default:
                    heightCM = 193.04
                }
                alternate = 250
                if (selectedGender == "Male")
                {
//                    BMR = 10W + 6.25H - 5A + 5
                    BMR = 10 * weight + 6.25 * heightCM - 5 * age + 5
                }else
                {
//                    BMR = 10W + 6.25H - 5A - 161
                    BMR = 10 * weight + 6.25 * heightCM - 5 * age - 161
                }
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            

            
        }
        .frame(width: 380, height: 300, alignment: .center)
        
        
        
        
    }
    // ZStack
    }// body end
}


struct CalView_Previews: PreviewProvider {
    static var previews: some View {
        CalView(weight: 0, age: 0)
    }
}
