//
//  StoryChatView.swift
//  KatanaExperiment
//
//  Created by Andrea De Angelis on 14/07/2017.
//

import Foundation
import UIKit
import PinLayout
import Hero
import Tempura

class LocalStateTestView: UIView, ModellableView {
  
  typealias VM = LocalStateTestViewModel
  
  // MARK: - SUBVIEWS
  
  lazy var globalCounterLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  lazy var localCounterLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  lazy var subButton: UIButton = {
    let b = UIButton(type: .custom)
    //b.setImage(UIImage(named:"close")!, for: .normal)
    return b
  }()
  
  lazy var addButton: UIButton = {
    let b = UIButton(type: .custom)
    //b.setImage(UIImage(named:"close")!, for: .normal)
    return b
  }()
  
  // MARK: - SETUP
  
  func setup() {
    // add subviews
    self.addSubview(self.globalCounterLabel)
    self.addSubview(self.localCounterLabel)
    self.addSubview(self.subButton)
    self.addSubview(self.addButton)
    self.subButton.on(.touchUpInside) { [weak self] button in
      self?.subButtonDidTap?()
    }
    self.addButton.on(.touchUpInside) { [weak self] button in
      self?.addButtonDidTap?()
    }
  }
  
  // MARK: - STYLE
  func style() {
    self.backgroundColor = .white
    self.subButton.backgroundColor = .red
    self.subButton.setTitle("sub local counter", for: .normal)
    self.addButton.backgroundColor = .blue
    self.addButton.setTitle("add local counter", for: .normal)
    self.globalCounterLabel.font = App.Style.Font.h2
    self.globalCounterLabel.textAlignment = .center
    self.globalCounterLabel.textColor = App.Style.Palette.black
    self.localCounterLabel.font = App.Style.Font.h2
    self.localCounterLabel.textAlignment = .center
    self.localCounterLabel.textColor = App.Style.Palette.black
  }
  
  // MARK: - UPDATE
  func update(oldModel: LocalStateTestViewModel) {
    self.globalCounterLabel.text = self.model.globalCounterString
    self.localCounterLabel.text = self.model.localCounterString
  }
  
  // MARK: - INTERACTION
  var subButtonDidTap: Interaction?
  var addButtonDidTap: Interaction?
  
  // MARK: - LAYOUT

  override func layoutSubviews() {
    super.layoutSubviews()
    self.globalCounterLabel.pin.size(CGSize(width: 300.0, height: 60.0))
    self.globalCounterLabel.pin.hCenter()
    self.globalCounterLabel.pin.top()
    self.localCounterLabel.pin.size(of: self.globalCounterLabel)
    self.localCounterLabel.pin.top(to: self.globalCounterLabel.edge.bottom)
    self.localCounterLabel.pin.hCenter()
    self.subButton.pin.width(150).height(80).left().top(to: self.localCounterLabel.edge.bottom)
    self.addButton.pin.width(150).height(80).right().top(to: self.localCounterLabel.edge.bottom)
  }
}