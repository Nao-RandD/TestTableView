//
//  AddViewController.swift
//  TestTableView
//
//  Created by Naoyuki Kan on 2021/08/15.
//

import UIKit
import Foundation

class AddViewController: ViewController {
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDetail: UITextField!
    @IBOutlet weak var saveLabel: UILabel!

    var manager: FileManager?

    override func viewDidLoad() {
        manager = FileManager.default
        // Documents/
        guard let documentDir = try! manager?.url(for: .documentDirectory,
                                                         in: .userDomainMask,
                                                         appropriateFor: nil,
                                                         create: false) else {
            return
        }
        let path = documentDir.appendingPathComponent("sample.plist")
        // 読み込み
        let user = NSDictionary(contentsOf: path)
        saveLabel.text = user?["Name"] as? String
    }

    @IBAction func tapAddButton(_ sender: Any) {
        // Documents/
        guard let documentDir = try! manager?.url(for: .documentDirectory,
                                                         in: .userDomainMask,
                                                         appropriateFor: nil,
                                                         create: false) else {
            return
        }
        let path = documentDir.appendingPathComponent("sample.plist")
        let user = NSDictionary(dictionary: ["Name":"Tim Cook"])

        // 書き込み
        user.write(to: path, atomically: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }
}
