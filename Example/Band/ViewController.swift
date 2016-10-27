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
    var data = [Member]()
    
    lazy var states: [ViewState] = {
        let empty = Empty(when: { () -> Bool in
            return self.isEmpty()
        })
        let unstable = Unstable(when: { () -> Bool in
            return !Reachability.isConnectedToNetwork()
        })
        return [Loading(), empty, unstable]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.show(Loading.state)
        Member.members { [unowned self] (members, error) in
            let failure = Failure(when: { () -> Bool in
                    return error != nil
                }, model: error)
            self.states.append(failure)
            self.data = members
            self.tableView.reloadData()
            self.updateViewIfNeeded([Unstable.state, Empty.state, Failure.state])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func isEmpty() -> Bool {
        return data.count == 0
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        cell.textLabel?.text = data[(indexPath as NSIndexPath).row].name
        return cell
    }
}
