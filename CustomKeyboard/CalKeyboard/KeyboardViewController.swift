//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var helloButton: UIButton!
    @IBOutlet weak var goodbyeButton: UIButton!
    @IBOutlet weak var welcomeButton: UIButton!
    @IBOutlet weak var seeyouButton: UIButton!
    @IBOutlet var nextKeyboardButton: UIButton!
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        helloButton.addTarget(self, action:
            "helloChar", forControlEvents: .TouchUpInside)
        goodbyeButton.addTarget(self, action:
            "goodbyeChar", forControlEvents: .TouchUpInside)
        welcomeButton.addTarget(self, action:
            "welcomeChar", forControlEvents: .TouchUpInside)
        seeyouButton.addTarget(self, action:
            "seeyouChar", forControlEvents: .TouchUpInside)
        returnButton.addTarget(self, action:
            "newline", forControlEvents: .TouchUpInside)
        deleteButton.addTarget(self, action:
            "backspace", forControlEvents: .TouchUpInside)
    }
    func helloChar() {
        textDocumentProxy.insertText("hello")
    }
    func goodbyeChar() {
        textDocumentProxy.insertText("goodbye")
    }
    func seeyouChar() {
        textDocumentProxy.insertText("seeyou")
    }
    func welcomeChar() {
        textDocumentProxy.insertText("welcome")
    }
    
    func newline() {
        textDocumentProxy.insertText("\n")
    }
    
    func backspace() {
        textDocumentProxy.deleteBackward()
    }

}
