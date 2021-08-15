//
//  Product.swift
//  TestTableView
//
//  Created by Naoyuki Kan on 2021/08/15.
//

import Foundation

struct Product {
    private(set) public var name: String
    private(set) public var detail: String

    init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}
