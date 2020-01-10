//
//  ViewController.swift
//  DotstudioProSample
//
//  Created by Ketan Sakariya on 19/12/19.
//  Copyright © 2019 Ketan Sakariya. All rights reserved.
//

import UIKit


class Sample {
    enum SampleType {
        case none
        case simplePlayer
        case customPlayer
        case advancedPlayer
    }

    var title: String = ""
    var description: String = ""
    var type: SampleType = .none
    init(_ title: String, description: String, type: SampleType) {
//        super.init()
        self.title = title
        self.description = description
        self.type = type
    }
}

class SampleTableViewCell: UITableViewCell {
    @IBOutlet var labelTitle: UILabel?
    @IBOutlet var labelDescription: UILabel?
    
    var sample: Sample?
    func setSample(_ sample: Sample) {
        self.sample = sample
        self.labelTitle?.text = sample.title
        self.labelDescription?.text = sample.description
    }
}

class ViewController: UIViewController {

    var samples: [Sample] = [
        Sample("Simple Player", description: "A Simple Default Player which can be directly launched Without any configuration.", type: .simplePlayer),
        Sample("Advanced Player", description: "A Advanced Player.", type: .advancedPlayer),
//        Sample("Custom Player", description: "A Custom Player.", type: .customPlayer)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func showSample(_ sampleType: Sample.SampleType) {
        switch sampleType {
        case .simplePlayer:
            self.showSimplePlayer()
            break
        case .advancedPlayer:
            self.showAdvancedPlayer()
            break
        default:
            break
        }
    }
    
    func showSimplePlayer() {
        if let dsProSimplePlayer = self.getViewControllerFromStoryboardName("DSProSimplePlayer", strViewControllerIdentifier: "DSProSimplePlayer") as? DSProSimplePlayer {
            self.show(dsProSimplePlayer, sender: self)
        }
    }
    func showAdvancedPlayer() {
        if let dsProAdvancedPlayer = self.getViewControllerFromStoryboardName("DSProAdvancedPlayer", strViewControllerIdentifier: "DSProAdvancedPlayer") as? DSProAdvancedPlayer {
            self.show(dsProAdvancedPlayer, sender: self)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.samples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sampleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as? SampleTableViewCell else {
            return UITableViewCell()
        }
        let sample = self.samples[indexPath.row]
        sampleTableViewCell.setSample(sample)
        return sampleTableViewCell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sample = self.samples[indexPath.row]
        self.showSample(sample.type)
    }
}





