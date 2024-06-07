//
//  HomeView.swift
//  Challenge_MultiplicationApp
//
//  Created by Vounatsou, Maria on 5/6/24.
//

import SwiftUI

struct HomeView: View {
    
    let letters = Array("Play with Numbers")
    let tryMe = Array("!!!TRY ME!!!")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            Image("HomeImage")
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
                }
                VStack(spacing: 5) {
                    
                    Text("MultiplicationApp")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.purple)
                    
                    HStack(spacing: 0) {
                        ForEach(0..<tryMe.count, id: \.self) { num in
                            Text(String(tryMe[num]))
                                .padding(4)
                                .font(.title)
                                .background(enabled ? .blue : .yellow)
                                .offset(dragAmount)
                                .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                dragAmount = .zero
                                enabled.toggle()
                            }
                    )
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 150)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 150))
                .opacity(1)
                
                Spacer()
                
                HStack(spacing: 0) {
                    ForEach(0..<letters.count, id: \.self) { num in
                        Text(String(letters[num]))
                            .padding(4)
                            .font(.title)
                            .background(enabled ? .blue : .yellow)
                            .offset(dragAmount)
                            .animation(.linear.delay(Double(num) / 20), value: dragAmount)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            dragAmount = .zero
                            enabled.toggle()
                        }
                )
                Spacer()
            }
            .padding(.horizontal, 0)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    @State static var isShowing = false
    static var previews: some View {
        HomeView(presentSideMenu: $isShowing)
    }
}

