//
//  ContentView.swift
//  Edutainment
//
//  Created by Aaron Thompson on 06/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedQuestions = 10
    @State private var selectedNumber = 1
    @State private var menuHidden = false
    @State private var questions = [Int]()
    @State private var round = 0
    @State private var answer: Int = 1
    
    let noOfQuestionOptions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            ZStack {
//                Color.orange
                if !menuHidden {
                    VStack {
                        Spacer()
                        Picker("Number of rounds", selection: $selectedQuestions){
                            ForEach(noOfQuestionOptions, id: \.self){
                                Text("\($0)")
                            }
                        }.pickerStyle(.segmented)
                        Spacer()
                        Grid {
                            GridRow {
                                ForEach(1..<4){ number in
                                    
                                    Button("\(number)"){
                                        startQuiz(number)
                                    }
                                    .frame(width: 100, height: 50)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .font(.title)
                                }
                            }
                            
                            GridRow {
                                ForEach(4..<7){ number in
                                    
                                    VStack {
                                        Button("\(number)"){
                                            startQuiz(number)
                                        }
                                        .frame(width: 100, height: 40)
                                        .background(.cyan)
                                        .foregroundColor(.white)
                                        .font(.title)
                                    }
                                    
                                }
                            }
                            
                            GridRow {
                                ForEach(7..<10){ number in
                                    
                                    Button("\(number)"){
                                        startQuiz(number)
                                    }
                                    .frame(width: 100, height: 40)
                                    .background(.cyan)
                                    .foregroundColor(.white)
                                    .font(.title)
                                }
                            }
                        }
                        Spacer()
                        Spacer()
                    }
                }
                
                //This is the game view that shows when the user has selected a number
                if menuHidden {
                    VStack {
                        Text("\(round + 1)").font(.largeTitle)
                        
                        HStack {
                            Text("\(questions[round]) * \(selectedNumber) = ")
                            Spacer()
                            //                        Button("Start", action: startQuiz)
                            TextField("\(questions[round]) * \(selectedNumber)", value: $answer, format: .number)
                                .onSubmit() {
                                    submitAnswer()
                                }
                        }
//                        Button("Submit", action: submitAnswer)
                    }
                }
                
            }.navigationTitle("Numbers")
        }
        .padding()
        
    }
    
    func startQuiz(_ number: Int) {
        selectedNumber = number
        //generate numbers based on the selected number
        for _ in 0...selectedQuestions {
            questions.append(Int.random(in: 0...12))
        }
        
        menuHidden.toggle()
    }
    
    
    func submitAnswer() {
        print("\(questions.count)")
        if answer == (questions[round] * selectedNumber){
            print("Correct!")
        } else {
            print("Wrong!")
        }
        round += 1
    }
}

#Preview {
    ContentView()
}
