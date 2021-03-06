//
//  ViewController.swift
//  UI
//
//  Created by Tatiana Podlesnykh on 1.7.2020.
//  Copyright © 2020 Tatiana Podlesnykh. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToNextScreen(_ sender: Any) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goButton.layer.cornerRadius = 25
        
        makeFlyingEmoji()
        
    }
    
    // MARK: - Animation
    
    func makeFlyingEmoji() {
        let emitter = Emitter.get()
        emitter.emitterPosition = CGPoint(x: view.frame.width/2,
                                          y: view.frame.maxY)
        emitter.emitterSize = CGSize(width: view.frame.width,
                                     height: 100)
        view.layer.insertSublayer(emitter, at: 0)
    }
        
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Change navigation bar items
        // Back button
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }

}

