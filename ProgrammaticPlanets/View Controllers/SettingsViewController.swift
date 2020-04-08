//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch = UISwitch()

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        setupSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Action Handlers
    
    @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    private func setupSubViews() {
        // Button
        let doneButton = UIButton(type: .system)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        view.addSubview(doneButton)
        
        let doneButtonTopConstraint = doneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        let doneButtonTrailingConstraint = NSLayoutConstraint(item: doneButton,
                                                              attribute: .trailing,
                                                              relatedBy: .equal,
                                                              toItem: view.safeAreaLayoutGuide,
                                                              attribute: .trailing,
                                                              multiplier: 1,
                                                              constant: -20)
        // Switch
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto(_:)), for: .valueChanged)
        view.addSubview(shouldShowPlutoSwitch)
        
        let switchTopConstraint = shouldShowPlutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 60)
        let switchTrailingConstraint = shouldShowPlutoSwitch.trailingAnchor.constraint(equalTo: doneButton.trailingAnchor)
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Is Pluto a planet"
        view.addSubview(label)
        
        let labelLeadingConstraint = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        
        let labelCenterYConstraint = label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor)
        
        
        NSLayoutConstraint.activate([doneButtonTopConstraint, doneButtonTrailingConstraint, switchTopConstraint, switchTrailingConstraint, labelLeadingConstraint, labelCenterYConstraint])
    }
}
