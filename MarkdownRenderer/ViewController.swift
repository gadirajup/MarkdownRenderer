//
//  ViewController.swift
//  MarkdownRenderer
//
//  Created by Prudhvi Gadiraju on 5/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var additionalWindows = [UIWindow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIScreen.didConnectNotification, object: nil, queue: nil) { [weak self] notification in
            guard let self = self else { return }
            
            guard let newScreen = notification.object as? UIScreen else { return }
            let screenDimensions = newScreen.bounds
            
            let newWindow = UIWindow(frame: screenDimensions)
            newWindow.screen = newScreen
            
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewViewController") else { fatalError() }
            
            newWindow.rootViewController = vc
            newWindow.isHidden = false
            self.additionalWindows.append(newWindow)
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        guard let preview = additionalWindows.first?.rootViewController as? PreviewViewController else { return }
        preview.text = textView.text
    }
    
}

