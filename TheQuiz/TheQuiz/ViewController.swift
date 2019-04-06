//
//  ViewController.swift
//  TheQuiz
//
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    struct Question
    {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    
    var questions: [Question] = [
        Question(
            question: "Which language is used to develop iOS apps?",
            answers: ["Java", "Swift", "Python", "PHP"],
            correctAnswer: 1),
        Question(
            question: "What are numbers with fractional components called in Swift?",
            answers: ["Sinking numbers", "Decimals", "Floating numbers", "Fractional numbers"],
            correctAnswer: 2),
        Question(
            question: "Which keyword do you use to announce constants in Swift? ",
            answers: ["Var", "Let", "Con", "Value"],
            correctAnswer: 1),
        Question(
            question: " What are the advantages of Swift?",
            answers: ["Swift is safe", "Swift is fast", "Swift is open source", "All of the above"],
            correctAnswer: 3),
        Question(
            question: "What are the control transfer statements used in Swift?",
            answers: ["Continue", "Break", "Fallthrough", "All of these"],
            correctAnswer: 3),
        
        
    ]
    
    var currentQuestion: Question?
    var currentQuestionPos = 0
    
    var noCorrect = 0
    
    
    @IBOutlet var lblQuestion: UITextView!
    @IBOutlet var answer0: UIButton!
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    @IBOutlet var answer4: UIButton!
    @IBOutlet var answer5: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestion = questions[0]
        setQuestion()
        setGradientBackground()
    }

    
    // Check if an answer is correct then load the next question
    func checkAnswer(idx: Int) {
        if(idx == currentQuestion!.correctAnswer) {
            noCorrect += 1
        }
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        // Show next question
        if(currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
            // If there are no more questions show the results
        } else {
            let alertController = UIAlertController(title: "Congrats!", message: "Your Score is \(noCorrect)", preferredStyle: .alert)
            let actionOk = UIAlertAction(title: "OK",
                                         style: .default,
                                         handler: nil)
            alertController.addAction(actionOk)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func answer1Action(_ sender: Any) {
        checkAnswer(idx: 0)
    }
    
    @IBAction func answer2Action(_ sender: Any) {
        checkAnswer(idx: 1)
    }
    
    @IBAction func answer3Action(_ sender: Any) {
        checkAnswer(idx: 2)
    }
    
    @IBAction func answer4Action(_ sender: Any) {
        checkAnswer(idx: 3)
    }
    @IBAction func answer5Action(_ sender: Any) {
        checkAnswer(idx: 4)
    }
    
    
    // Set labels and buttons for the current question
    func setQuestion() {
        lblQuestion.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        //lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count)"
    }
    
    // Set the background as a blue gradient
    func setGradientBackground() {
        lblQuestion.isUserInteractionEnabled = false
        self.lblQuestion.textColor = UIColor.blue
    }
}

