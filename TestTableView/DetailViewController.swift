//
//  DetailViewController.swift
//  TestTableView
//
//  Created by Naoyuki Kan on 2021/08/15.
//

import UIKit

class DetailViewController: ViewController {

    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    var selectProduct: Product!

    override func viewDidLoad() {
        productLabel.text = selectProduct.name
        detailTextView.text = selectProduct.detail
    }
}

// LocalizeStringで商品内容を参照
