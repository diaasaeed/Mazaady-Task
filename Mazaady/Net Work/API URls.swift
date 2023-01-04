//f sdf sdf  ffdsf s
//  API URls.swift
//  test app 2
//
//  Created by Ahmed on 2/10/21.
//

import Foundation

class URls{
    lazy fileprivate var Domain = "https://staging.mazaady.com/api/v1/"

    static let shared = URls()
    
    lazy var AllCategoryURL = "\(Domain)get_all_cats"
    lazy var subcategoryURL = "\(Domain)properties?cat="
    lazy var optionURL = "\(Domain)get-options-child/"
 
}

