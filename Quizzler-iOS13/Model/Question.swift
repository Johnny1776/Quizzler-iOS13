//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by John Durcan on 12/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let question: String
    let wrongAnswers: [String]
    let correctAnswers: [String]
    init(q: String, trueAnswer: [String], falseAnswer: [String] ) {
        question = q
        wrongAnswers = falseAnswer
        correctAnswers = trueAnswer
    }
    func getAnswers() -> Array<String>{
        return self.wrongAnswers + self.correctAnswers
    }
    
    func checkAnswer(_ a: String) -> Bool{
        return self.correctAnswers.contains(a)
    }
}
