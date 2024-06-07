//
//  GameView.swift
//  Challenge_MultiplicationApp
//
//  Created by Vounatsou, Maria on 5/6/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            Image("YellowPic")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentSideMenu.toggle()
                    } label: {
                        Image("clickMe")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    
                    Text("GAME'S TIME")
                        .padding()
                        .font(.largeTitle)
                        .foregroundStyle(Color("ColorR"))
                        .bold()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                Spacer()
                Spacer()
                
                VStack(alignment: .center, spacing: 70) {
                    Text("Let's Go: \(viewModel.randomNumber) x \(viewModel.randomUser)")
                        .font(.title)
                        .padding()
                        .background(Color("ColorR"))
                        .cornerRadius(8)
                    
                    Section("Ready to answer?!") {
                        TextField("Place your answer", text: $viewModel.userAnswer)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color("ColorR"))
                            .cornerRadius(8)
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    .foregroundColor(.blue)
                    .bold()
                    
                    Button("Submit") {
                        viewModel.submitAnswer()
                    }
                    .padding()
                    .font(.system(size: 24))
                    .frame(width: 120.0, height: 80)
                    .background(Color.blue)
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
                    .cornerRadius(8)
                    
                    Text("\(viewModel.textDisplay)")
                        .font(.title)
                        .padding()
                }
                .padding()
                
                .alert("The game is over", isPresented: $viewModel.alertBool) {
                    Button("Restart", action: viewModel.terminal)
                } message: {
                    Text("""
                                Your final score is \(viewModel.score)
                                Incorrect answers: \(viewModel.negativeScore)
                            """)
                    .fontWeight(.bold)
                }
            }
            .onAppear {
                viewModel.generateNewQuestion()
            }
        }
        .padding(.vertical,0)
    }
}


struct GameView_Previews: PreviewProvider {
    @State static var isShowing = false
    static var previews: some View {
        GameView(presentSideMenu: $isShowing)
            .environmentObject(GameViewModel(numberOfTables: 2, rounds: [2, 5, 10, 20]))
    }
}
