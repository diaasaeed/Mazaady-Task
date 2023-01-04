//
//  PropertyPresenter.swift
//  Mazaady
//
//  Created by sameh mohammed on 04/01/2023.
//

import Foundation
import Alamofire

protocol successProtocol{
    func success()
}

class PropertyPresenter{
    private var success:successProtocol?
    
     var categories = [Category]()
    var ProcessType = [ProcessTypeDataModel]()
    
    init(success:successProtocol) {
        self.success = success
    }
    // get all category
    func getAllCategory(){
        categories.removeAll()
        API.shared.getData(url: URls.shared.AllCategoryURL, method: .get, params: nil, encoding: JSONEncoding.default, headersType: .langOnly) { (data:PropertyModel?, statusCode, error) in
            if let error = error{
                print("Error",error.localizedDescription)
            }else if let data = data{
                self.categories.append(contentsOf: data.data?.categories ?? [])
                self.success?.success()
            }
        }
    }
    
    
    func AllCategory()->[Category]{
        return categories
    }
     
    
    //MARK: -  get all Property
    func getProperty(catID:Int){
        ProcessType.removeAll()
        let url = URls.shared.subcategoryURL+"\(catID)"
        print("URL",url)
        API.shared.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headersType: .langOnly) { (data:ProcessTypeModel?, statusCode, error) in
            if let error = error{
                print("Error",error.localizedDescription)
            }else if let data = data{
                self.ProcessType.append(contentsOf: data.data ?? [])
                self.success?.success()

            }
        }
    }
    
    func getAllProcessType()-> [ProcessTypeDataModel]{
        return ProcessType
    }
    
    // MARK: - get options
    func getOption(id:Int){
        ProcessType.removeAll()
        let url = URls.shared.optionURL+"\(id)"
        print("URL",url)
        API.shared.getData(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headersType: .langOnly) { (data:ProcessTypeModel?, statusCode, error) in
            if let error = error{
                print("Error",error.localizedDescription)
            }else if let data = data{
                self.ProcessType.append(contentsOf: data.data ?? [])
                self.success?.success()
            }
        }
    }
    
    func getAllOptionType()-> [OptionModel]{
        if !(ProcessType.isEmpty){
            if !(ProcessType[0].options?.isEmpty ?? false) {
                return ProcessType[0].options ?? []
            }
        }
        return []
    }
}
