//
//  ViewController.swift
//  Notify
//
//  Created by Ivan Kopiev on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func didTapOnButton(_ sender: Any) { [weak self] in
        Notify.showSuccsess(title: "Hello Bro\nHow are you!?") {
            self?.view.backgroundColor = .systemPink
        }
    }
}

extension UIView {
    @IBInspectable
    public var cornerRadius: CGFloat
    {
        set (radius) {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = radius > 0
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
}
