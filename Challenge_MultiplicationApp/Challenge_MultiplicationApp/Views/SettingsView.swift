//
//  SettingsView.swift
//  Challenge_MultiplicationApp
//
//  Created by Vounatsou, Maria on 5/6/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var presentSideMenu: Bool
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        
        ZStack {
            Image("YellowPic")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        Image("clickMe")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    Spacer()
                    
                    Text("Settings")
                        .padding()
                        .font(.largeTitle)
                        .foregroundStyle(Color("ColorR"))
                        .bold()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                Text("Number of Rounds")
                    .font(.title)
                    .bold()
                    .padding(22)
                    .background(Color("ColorR"))
                    .cornerRadius(8)
                
                Section {
                    Picker("Select", selection: $viewModel.selectedRounds) {
                        ForEach(viewModel.rounds, id: \.self) { round in
                            Text("\(round)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                }
                .padding()
                
                VStack(alignment: .center, spacing: 30 ) {
                    Stepper("Tables selected: \(viewModel.numberOfTables.formatted())", value: $viewModel.numberOfTables, in: 2...12)
                        .onChange(of: viewModel.numberOfTables) { newValue in
                            viewModel.generateNewQuestion()
                        }
                        .padding(-10)
                }
                .bold()
                .padding(22)
                .background(Color("ColorR"))
                .font(.system(size: 24))
                .cornerRadius(8)
                
                Spacer()
                Spacer()
                
                Button("""
                        Difficulty
                        Level
                        """) {}
                    .padding(40)
                    .fontWeight(.heavy)
                    .background(.blue)
                    .foregroundStyle(.yellow)
                    .clipShape(.circle)
                    .scaleEffect(1 + CGFloat(viewModel.numberOfTables - 2) * 0.1)
                
                Spacer()
                
            }
            .padding(.horizontal, 20)
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    @State static var isShowing = false
    static var previews: some View {
        SettingsView(presentSideMenu: $isShowing)
            .environmentObject(GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20]))
    }
}
