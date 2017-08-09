//
//  ViewController.swift
//  InitialInteractive
//
//  Created by Alexander Anderl on 08.08.17.
//  Copyright © 2017 Alexander Anderl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Push the button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pushTheButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Parent"
        view.backgroundColor = .white
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func pushTheButton() {
        let vc = PushedViewController()
        navigationController?.setViewControllers([self, vc], animated: true)
        if let tc = navigationController?.transitionCoordinator {
            print(tc)
            print(tc.initiallyInteractive)
            //Should never be true here
            assert(!tc.initiallyInteractive)
            //The problem is that the previous transitionCoordinator of the swipe back gesture is used again
        }
    }
    
}

