//
//  ViewController.swift
//  testUberSignature
//
//  Created by Admin on 02.09.2020.
//  Copyright © 2020 Anton Dobrynin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private weak var drawingViewController: SignatureDrawingViewController!
    @IBOutlet weak var signatureContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.signatureContainer.clipsToBounds = true
        self.signatureContainer.layer.cornerRadius = 3
        self.signatureContainer.layer.borderColor = UIColor(named: "C4C4C4")?.cgColor
        self.signatureContainer.layer.borderWidth = 1
        
        let singnatureVC = SignatureDrawingViewController(image: nil)
        singnatureVC.signatureColor = .black
        singnatureVC.delegate = self
        self.addChild(singnatureVC)
    // *
        self.signatureContainer.insert(view: singnatureVC.view)
        singnatureVC.didMove(toParent: self)
        self.drawingViewController = singnatureVC
        singnatureVC.view.frame = self.signatureContainer.frame
    }
    
    @IBAction func clearField(_ sender: UIButton) {
        drawingViewController.reset()
    }
}

// MARK: - SignatureDrawingViewControllerDelegate
extension ViewController: SignatureDrawingViewControllerDelegate {
    func signatureDrawingViewControllerIsEmptyDidChange(controller: SignatureDrawingViewController, isEmpty: Bool) {
        
        print("Signatured")
    }
}

// MARK: - insert extension
extension UIView {
    func insert(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        constraintsInsert(view: view)
    }
    
    func constraintsInsert(view: UIView) {
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            view.widthAnchor.constraint(equalTo:   self.widthAnchor),
            view.heightAnchor.constraint(equalTo:  self.heightAnchor)
        ])
    }
}

