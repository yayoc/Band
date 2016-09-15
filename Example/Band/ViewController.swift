//
//  ViewController.swift
//  Band
//
//  Created by yayoc on 09/08/2016.
//  Copyright (c) 2016 yayoc. All rights reserved.
//

import UIKit
import Band

class ViewController: UIViewController, BandViewControllerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var states: [ViewState] = [Loading(), Empty(), Unstable()]
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.show(state: Loading.state)
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.data = ["Levon Helm", "Robbie Robertson", "Rick Danko", " Garth Hudson", "Richard Manuel"]
            self.tableView.reloadData()
            self.hideAll()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row]
        return cell
    }
}
