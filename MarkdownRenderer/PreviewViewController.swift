//
//  PreviewViewController.swift
//  MarkdownRenderer
//
//  Created by Prudhvi Gadiraju on 5/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import Down

class PreviewViewController: UIViewController {
    @IBOutlet weak var outputView: UITextView!
    
    var text: String = "" {
        didSet {
            let down = Down(markdownString: text)
            let style = "body { font: 200% sans-serif; }"
            let attributedString = try? down.toAttributedString(.default, stylesheet: style)
            outputView.attributedText = attributedString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
