//
//  ViewController.swift
//  Trivia
//
//  Created by Melissa Campos Huallanca on 6/26/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    
    
    

    struct Question {
        let question: String
        let answers: [String]
    }
    
    
    
    let questions: [Question] = [
        
        Question(question: "Who was the first president of the U.S?",
            answers: ["George Washington", "Abraham Lincoln", "John Adams", "Thomas Jefferson"]),
        Question(question: "What is the capital of France?",
                 answers: ["Berlin", "Paris", "Rome", "Madrid"]),
        Question(question: "Which planet is known as the Red Planet?",
                 answers: ["Uranus", "Jupiter", "Saturn", "Mars"]),
        Question(question: "What is the largest ocean on Earth?",
                 answers: ["Atlantic Ocean", "Pacific Ocean", "Indian Ocean", "Arctic Ocean"]),
    ]
    
    
    
    
    var currentQuestionIndex: Int = 0
        
        
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count {
            showQuestion()
        }else{
            progressLabel.text = "Trivia Over!"
            questionLabel.text = "You answered all the questions!"
            for button in answerButtons {
                button.isHidden = true
            }
            
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view.
    }
    
    
    func showQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        
        progressLabel.text = "Question \(currentQuestionIndex + 1)/\(questions.count)"
        questionLabel.text = currentQuestion.question
        
        
        for (index, button) in answerButtons.enumerated() {
            if index < currentQuestion.answers.count {
                button.setTitle(currentQuestion.answers[index], for: .normal)
                button.isHidden = false
            }else{
                button.isHidden = true
            }
        }
        
    }
    



}
