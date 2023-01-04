//
//  PickerViewSelectedVC.swift
//  Mazaady
//
//  Created by sameh mohammed on 04/01/2023.
//


protocol PickerViewProtocol{
    func pikcerInfo(name:String , id:Int , type:typePicker , indexSelected:Int)
}


import UIKit

class PickerViewSelectedVC: UIViewController {

    //MARK: - outlet
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - variable
    var action:PickerViewProtocol?
    var index = 0 // index Picker view selected
    var indexCategory = 0
    var indexSubcategory = 0
    var type:typePicker?
    var category = [Category]()
    var processType = [ProcessTypeDataModel]()
    var options = [OptionModel]()
//    var indexOption = 0
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - function

    func pickerCount()->Int{ // get count rows
        var num = 0
        if type == .category{
            num = category.count
        }else if type == .subcategory{
            num = category[indexCategory].children?.count ?? 0
        } else if type == .processType{
            num = processType[0].options?.count ?? 0
        }else if type == .brand { // brand
            num = processType[1].options?.count ?? 0
        }else if type == .transmission {
            num = processType[2].options?.count ?? 0
        }else if type == .model ||  type == .type{
            num = options.count
        }
        return num
    }
    
    func pickerTitle(index:Int)->String{ // get title row
        var title = ""
        if type == .category{ // category
            title = category[index].name ?? ""
        }else if type == .subcategory{ // subcategory
            title = category[indexCategory].children?[index].name ?? ""
        } else if type == .processType { // process type
            title =  processType[0].options?[index].name ?? ""
        }else if type == .brand { // brand
            title = processType[1].options?[index].name ?? ""
        }else if type == .transmission {
            title = processType[2].options?[index].name ?? ""
        }else if type == .model ||  type == .type{
            title = options[index].name ?? ""
        }
        return title
    }
    
    func pickerSelectedID(index:Int)->Int{// get Row ID
        var id = 0
        if type == .category{
            id = category[index].id ?? 0
        }else if type == .subcategory{
            id = category[indexCategory].children?[index].id ?? 0
        } else if type == .processType{
            id = processType[0].options?[index].id ?? 0
        }else if type == .brand{
            id = processType[1].options?[index].id ?? 0
        }else if type == .transmission {
            id = processType[2].options?[index].id ?? 0
        }else if type == .model ||  type == .type{
            id = options[index].id ?? 0
        }
        
        return id
    }
    //MARK: - action
    
    @IBAction func DoneBTN(_ sender: Any) {
        action?.pikcerInfo(name: pickerTitle(index: index) ,
                           id:pickerSelectedID(index: index) ,
                           type: type!,
                           indexSelected: self.index)
     
        self.dismiss(animated: false)
    }
    
    @IBAction func CancelBTN(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
}


extension PickerViewSelectedVC:UIPickerViewDataSource , UIPickerViewDelegate{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTitle(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.index = row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Helvetica Neue", size: 14)
        label.text =  pickerTitle(index: row)
        label.textAlignment = .center
        return label
    }
    
}
