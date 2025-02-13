//
//  ContentView.swift
//  FizzBuzz
//
//  Created by ditthales on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel = ContentViewModel()) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        ZStack {
            Color(viewModel.colorBackground)
            
            switch viewModel.state {
            case .playing:
                VStack {
                    LivesView(totalLives: $viewModel.totalLives,
                              remainingLives: $viewModel.remainingLives)
                    
                    Spacer()
                    
                    VStack (spacing: 25) {
                        HStack (spacing: 25) {
                            Button {
                                viewModel.scorePressed()
                            } label: {
                                Text("\(viewModel.currentLevel)")
                                    .font(.system(size: 50))
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .border(.white, width: 4)
                                    .cornerRadius(5)
                            }
                            Button {
                                viewModel.champagnePressed()
                            } label: {
                                Image("champagne")
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .border(.white, width: 4)
                                    .cornerRadius(5)
                            }
                            
                        }
                        HStack (spacing: 25) {
                            Button {
                                viewModel.lightningPressed()
                            } label: {
                                Image("lightning")
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .border(.white, width: 4)
                                    .cornerRadius(5)
                            }
                            Button {
                                viewModel.spacePressed()
                            } label: {
                                Image("space")
                                    .frame(width: 65, height: 65)
                                    .padding()
                                    .border(.white, width: 4)
                                    .cornerRadius(5)
                            }
                        }
                        
                    }
                    
                    Spacer ()
                    
                }
                .foregroundColor(.white)
                .padding(50)
                
            case .gameOver:
                VStack(spacing: 100) {

                    VStack(spacing: 30) {
                        Text("GAME OVER")
                            .font(.title)
                            .foregroundColor(.white)
                            .bold()
                        
                        Text("Your Score:  \(viewModel.currentLevel)")
                            .font(.headline)
                    }
                   
                    
                    Button {
                        viewModel.playAgainPressed()
                    } label: {
                        Text ("PLAY AGAIN")
                            .font(.title3)
                            .bold()
                        
                    }
                }
                .foregroundColor(.white)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
