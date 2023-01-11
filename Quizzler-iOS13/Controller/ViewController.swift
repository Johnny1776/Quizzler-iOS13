//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var answerBtns: [UIButton]!
    var answerResponse: String?
    var timer: Timer = Timer.init()
    var quizBrain: QuizBrain = QuizBrain.init()
    var btnSender: UIButton?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
    }

    fileprivate func setupScene() {
        quizBrain.resetBrain()
        scoreLabel.text = quizBrain.getScore()
        responseLabel.text = ""
        progressBar.setProgress(0, animated: true)
        displayQuestionAnswer()
    }
    
    @objc func setBtnBackground(){
        btnSender!.backgroundColor = .clear
        timer.invalidate()
    }
    
    func displayQuestionAnswer(){
        var i = 0
        var answers = quizBrain.isLastQuestion() ?  ["Continue"] : quizBrain.getAnswers()
        answers.shuffle()

        for b in self.answerBtns {
            b.tag = i
            b.isHidden = !(i < answers.count)
            b.setTitle((i < answers.count) ? answers[i] : "", for: .normal)
            i += 1
        }
        questionLabel.text = quizBrain.isLastQuestion() ? quizBrain.getFinishedText() : quizBrain.getQuestionText()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if questionLabel.text == quizBrain.getFinishedText() {
            setupScene()
        }else{
            let result = quizBrain.checkAnswer((sender.titleLabel?.text)!)
            progressBar.setProgress(quizBrain.getProgress(), animated: true)
            responseLabel.text = result ? "Correct" : "Wrong"
            sender.backgroundColor =  result ? .green : .red
            scoreLabel.text = quizBrain.getScore()
            btnSender = sender
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(setBtnBackground), userInfo: nil, repeats: true)
            quizBrain.questionPosition += 1
            displayQuestionAnswer()
            
        }
    }
}

