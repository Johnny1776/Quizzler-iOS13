//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by John Durcan on 12/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    
    var theQuestions: [Question] = [Question.init(q: "The First Question", trueAnswer: ["A True Answer", "Another True Answer"], falseAnswer: ["A false Answer", "Another False Answer"]),
                                    Question.init(q: "A question of three", trueAnswer: ["A True Answer"], falseAnswer: ["A false Answer", "Another False Answer"]),
                                    Question.init(q: "This question has three true answers", trueAnswer: ["A True Answer","A True Answer", "Another True Answer"], falseAnswer: ["A false Answer"]),
                                    Question.init(q: "A TRue/False Question", trueAnswer: ["True"], falseAnswer: ["False"]),
                                    Question.init(q: "A Trick question", trueAnswer: ["A True Answer", "Another True Answer","A True Answer", "Another True Answer"], falseAnswer: []),
                                    Question.init(q: "Only one right answer", trueAnswer: ["A True Answer"], falseAnswer: ["A false Answer", "Another False Answer", "Another False Answer"])]
    var questionPosition: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ answer: String) -> Bool{
        //We are mutating a internal struct property. So we must assign this func as mutating. "self" is immutable. Used for access. Self is automatically created as a let immutable object. A mutating method can change the state of the/this structure.
        self.score += self.theQuestions[self.questionPosition].checkAnswer(answer) ? 1:0
        return self.theQuestions[self.questionPosition].checkAnswer(answer)
    }
    
    func getQuestionText() -> String{
        return self.theQuestions[self.questionPosition].question
    }
    
    func getAnswers() -> Array<String>{
        return self.theQuestions[self.questionPosition].getAnswers()
    }
    
    mutating func resetBrain(){
        self.theQuestions.shuffle()
        self.score = 0
        self.questionPosition = 0
    }
    
    func getProgress() -> Float{
        return Float(self.questionPosition + 1)/Float(self.theQuestions.count)
    }
    
    func isLastQuestion() -> Bool{
        return self.questionPosition == self.theQuestions.count
    }
    
    mutating func getScore() -> String {
        return "\(self.score)/\(self.theQuestions.count)"
    }
    
    func getFinishedText() -> String{
        return "You scored \(self.score) out of \(self.theQuestions.count)."
    }
}
