//
//  ViewController.swift
//  2305Quiz3
//
//  Created by Abbe Azale on 2022-02-23.
//

import UIKit
import Foundation

struct Stack {
    var myArray: [String] = []
    
    mutating func push(_ element: String) {
        myArray.append(element)
    }
    
    mutating func pop() -> String? {
        return myArray.popLast()
    }
    
    func peek() -> String {
        guard let topElement = myArray.last else {return "This stack is empty."}
        return topElement
    }
}


//var childNames = Stack()



class ViewController: UIViewController {
    
   

    var childNames = Stack()
  
    //childNames.push("John")
    private let appTitle = UILabel()
    private let newName = UITextField()
    private let submitButton = UIButton()
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        didLoadSetup()
        
    }
}

extension ViewController {
    @objc func handleSubmitDidTouchUpInside(){
        //var addedName = newName.text
        childNames.push(newName.text!)
    
        
    }
}


private extension ViewController{
    
    func didLoadSetup(){
        view.addSubview(appTitle)
        view.addSubview(newName)
        view.addSubview(submitButton)
        setupAppTitle()
        setupNewName()
        setupSubmitButton()
    }
    
    func setupAppTitle(){
        appTitle.text = "Child Names"
        appTitle.textAlignment = .center
        appTitle.font = UIFont.systemFont(ofSize: 30)
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //centers it horizontally
            //titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            //use leading and trailing anchors to get the width of the label
            appTitle.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            appTitle.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            appTitle.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
    }
    
    
    func setupNewName(){
        newName.translatesAutoresizingMaskIntoConstraints = false
        newName.placeholder = "enter a name"
        
        
        NSLayoutConstraint.activate([
            //newName.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: -40),
            newName.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: submitButton.leftAnchor, constant: -110),
            newName.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
    }
    
    func setupSubmitButton(){
        submitButton.translatesAutoresizingMaskIntoConstraints  = false
        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(handleSubmitDidTouchUpInside), for: .touchUpInside)
        submitButton.backgroundColor = .systemGray6
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.layer.cornerRadius = 20
        submitButton.layer.masksToBounds = false
        
        NSLayoutConstraint.activate([
            submitButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100),
            submitButton.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -30),
            submitButton.safeAreaLayoutGuide.widthAnchor.constraint(equalTo: submitButton.safeAreaLayoutGuide.heightAnchor, multiplier: 3),
            submitButton.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

