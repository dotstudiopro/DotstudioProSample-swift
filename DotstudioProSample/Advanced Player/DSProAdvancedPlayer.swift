//
//  DSProAdvancedPlayer.swift
//  DotstudioProSample
//
//  Created by Ketan Sakariya on 10/01/20.
//  Copyright © 2020 Ketan Sakariya. All rights reserved.
//

import Foundation
import UIKit
import DotstudioPRO

class DSProAdvancedPlayer: UIViewController {
    
    @IBOutlet weak var playerContainerView: UIView!
    var dspPlayerViewController: DSPPlayerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initializeDSP()
    }
    func initializeDSP(){
        guard let window = self.view.window else {
            print("No Window found")
            return
        }
        SPLTConfig.window = window
        let dsProConfig: [String : Any] = ["apikey": "62a2dce99effae643d05c28f79d74e930a2cbfee",
                                           "APP_NAME": "DPRO",
                                           "APP_ID": "1310579805",
                                           "APP_URL": "https://apps.apple.com/us/app/DotstudioPRO-Test/id1310579805?ls=1",
        ]
        do {
            try DSPRO.initializeWith(config: dsProConfig, completion: { (bValue) in
                // Success
                print("Success")
                self.initializePlayer()
            }) { (error) in
                // Error
                print("Failure")
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
        
    
    func initializePlayer() {
        if let dspPlayerViewController = DSPPlayerViewController.getViewController(theme:[DSPPlayerTheme.themeColor:0xFF0000AA]) {
            self.dspPlayerViewController = dspPlayerViewController
            dspPlayerViewController.view.frame = self.playerContainerView.bounds
            self.playerContainerView.addSubview(dspPlayerViewController.view)
        }
        self.playVideo()
    }
    
    func playVideo() {
        let dspVideo = DSPVideo()
        dspVideo.strId = "5db1760099f815b22ad3255b" //"5caceac399f8156a2e4d9932"
        self.dspPlayerViewController?.setCurrentVideo(curVideo: dspVideo)
    }
}




