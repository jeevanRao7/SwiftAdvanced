//
//  Field.swift
//  SwiftAdvanced
//
//  Created by Jeevan on 10/02/17.
//  Copyright © 2017 com.iosteam.swift. All rights reserved.
//

import Foundation
import UIKit

protocol FieldBuilderProtocol {
    
    var fieldView:UIView! {get}
    var errorMessageLabel:UILabel? {get}
    var errorHintView:UIView? {get}
    var validationItemsArray:NSArray? {get}
    
}

class Field:FieldBuilderProtocol {
    
    var fieldView:UIView!
    var viewWrapperField:ViewWrapper?
    var errorMessageLabel:UILabel?
    var errorHintView:UIView?
    var validationItemsArray:NSArray?
    
    typealias buildFieldClosure = (Field) -> Void
    
    init(build:buildFieldClosure) {
        build(self)
        self.viewWrapperField =  ViewWrapperFactory().getViewWrapper(self.fieldView!);
        self.initFieldAttributes()
    }
   
    func initFieldAttributes() {
        self.errorHintView?.isHidden = true
        self.errorMessageLabel?.isHidden = true
        let singleFingerTap = UITapGestureRecognizer(target: self, action: #selector(self.handleSingleTapOnErrorHint))
        self.errorHintView?.addGestureRecognizer(singleFingerTap);
    }
    
    @objc func handleSingleTapOnErrorHint() {
       if (self.errorHintView?.isHidden)! {
              //Gaurd - touch event when no error.
        }
        else{
            self.errorMessageLabel?.isHidden = !(self.errorMessageLabel?.isHidden)!;
        }
    }
    
    func showErrorField(_ field: Field?, withMessage message: String) {
        self.showErrorField(field, withMessage: message, makeMessageVisible: false)
    }
    
    func showErrorField(_ field: Field?, withMessage message: String, makeMessageVisible messageVisibleFlag: Bool) {
        self.errorHintView?.isHidden = false
        self.errorMessageLabel?.isHidden = messageVisibleFlag
        self.errorMessageLabel?.text = message
    }
    
    func hideErrorField(_ field: Field?) {
        self.errorHintView?.isHidden = true
        self.errorMessageLabel?.isHidden = true
    }
    
}
