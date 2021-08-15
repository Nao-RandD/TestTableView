//
//  ViewController.swift
//  TestTableView
//
//  Created by Naoyuki Kan on 2021/07/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var products: [Product] = []


    override func viewDidLoad() {
//        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewDidLoad")

        loadData()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let tableView = self.tableView else {
            return
        }
        // tableViewの選択状態を解除するためのメソッド
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    /*
     prepare()はSegueが実行される前に呼ばれるメソッド。
     ここで次のViewContrllerが実行される前にやりたいことを実行することができる
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let destination = segue.destination as? DetailViewController else {
                    fatalError("Failed to prepare DetailViewController.")
                }

                destination.selectProduct = products[indexPath.row]
            }
        }
    }
}

extension ViewController {
    func loadData() {
        products.append(Product(name: "豚汁", detail: String(repeating: "ほげ", count: 20)))
        products.append(Product(name: "生姜焼き", detail: String(repeating: "ふが", count: 20)))
        products.append(Product(name: "牛丼", detail: String(repeating: "ほが", count: 20)))
        products.append(Product(name: "味噌汁", detail: String(repeating: "ふげ", count: 20)))
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // TableViewに表示する要素の数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    // TableViewに配置したCellの中身を入れてあげる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row].name

        return cell
    }
}
