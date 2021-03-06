//  Created ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Fauzi Sholichin @fauzisho
//

import Foundation

open class Observer<T> {
    open var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    open func addObserver(enable: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if enable {
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
}
