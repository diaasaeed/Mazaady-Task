//
//  ViewController.swift
//  Mazaady
//
//  Created by sameh mohammed on 04/01/2023.
//

enum typePicker{
    case category
    case subcategory
    case processType
    case brand
    case model
    case type
    case transmission
}


import UIKit

class PropertyVC: UIViewController{

    //MARK: - outlet
    @IBOutlet weak var CategoryTF: UITextField!
    @IBOutlet weak var subCategoryTF: UITextField!
    @IBOutlet weak var processTypeTF: UITextField!
    @IBOutlet weak var specifyTF: UITextField!
    @IBOutlet weak var brandTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var transmissionTF: UITextField!
    
    //MARK: - variable
    var presenter:PropertyPresenter?
    var subCategoryID = 0
    var processID = 0
    var brandID = 0
    var modelID = 0
    var typeID = 0
    var transmissionID = 0
    var indexCategory = 0
    var indexSubCategory = 0
    var type:typePicker?
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = PropertyPresenter(success: self)

    }
    
    //MARK: -
    func EmptyAllFileds(){
        transmissionTF.text = ""
        typeTF.text = ""
        brandTF.text = ""
        modelTF.text = ""
        processTypeTF.text = ""
        specifyTF.text = ""
        
    }

    
    //MARK: - actions
    @IBAction func categoryBTN(_ sender: Any) {
        type = .category
        presenter?.getAllCategory()
    }
    
    
    @IBAction func subCategoryBTN(_ sender: Any) {
        type = .subcategory
        if CategoryTF.text != "" {
            presenter?.getAllCategory()
        }
    }
    
    @IBAction func processTypeBTN(_ sender: Any) {
        type = .processType

        if subCategoryTF.text != "" && CategoryTF.text != ""{
            presenter?.getProperty(catID: subCategoryID)
        }
    }
    
    @IBAction func brandBTN(_ sender: Any) {
        type = .brand
        if subCategoryTF.text != "" && CategoryTF.text != ""{
            presenter?.getProperty(catID: subCategoryID)

        }
    }
    
    @IBAction func transmissionBTN(_ sender: Any) {
        type = .transmission
        if subCategoryTF.text != "" && CategoryTF.text != ""{
            presenter?.getProperty(catID: subCategoryID)

        }
    }
    
    @IBAction func modelBTN(_ sender: Any) {
        type = .model
        if subCategoryTF.text != "" && CategoryTF.text != "" && processTypeTF.text != "" && brandTF.text != ""{
            presenter?.getOption(id: self.brandID)

        }
    }
    
    @IBAction func typeBTN(_ sender: Any) {
        type = .type
        if subCategoryTF.text != "" && CategoryTF.text != "" && processTypeTF.text != "" && brandTF.text != "" && modelTF.text != ""{
            presenter?.getOption(id: self.modelID)

        }
    }
    
}

extension PropertyVC:PickerViewProtocol , successProtocol{
    func pikcerInfo(name: String, id: Int, type: typePicker  , indexSelected:Int) {
        if type == .category{
            self.CategoryTF.text = name
            self.indexCategory = indexSelected
            
            self.subCategoryTF.text = presenter?.AllCategory()[indexSelected].children?[0].name ?? ""
            self.subCategoryID = presenter?.AllCategory()[indexSelected].children?[0].id ?? 0
            self.EmptyAllFileds()
            
        }else if type == .subcategory{
            self.subCategoryTF.text = name
            indexSubCategory = indexSelected
            subCategoryID = id
            self.EmptyAllFileds()
            
        }else if type == .processType{
            self.processTypeTF.text = name
            processID = id
            
            
            self.brandTF.text = ""
            self.transmissionTF.text = ""
            if !(presenter?.getAllProcessType().isEmpty ?? false){
                if !(presenter?.getAllProcessType()[1].options?.isEmpty ?? false){
                    self.brandTF.text = presenter?.getAllProcessType()[1].options?[0].name ?? ""
                    brandID =  presenter?.getAllProcessType()[1].options?[0].id ?? 0
                }
                
                if !(presenter?.getAllProcessType()[2].options?.isEmpty ?? false){
                    self.transmissionTF.text = presenter?.getAllProcessType()[2].options?[0].name ?? ""
                    transmissionID =  presenter?.getAllProcessType()[2].options?[0].id ?? 0
                }
            }
           
        }else if type == .brand{
            self.brandTF.text = name
            brandID = id
            
        }else if type == .transmission{
            self.transmissionTF.text = name
            transmissionID = id
            
        }else if type == .model{
            self.modelTF.text = name
            modelID = id

        }else if type == .type{
            self.typeTF.text = name
            self.typeID = id

        }
    }
    
    func success() {
        let popUp = self.storyboard?.instantiateViewController(withIdentifier: "PickerViewSelectedVC") as! PickerViewSelectedVC
        popUp.type = self.type
        popUp.action = self
         if type == .category{
             popUp.category = presenter?.AllCategory() ?? []
             self.present(popUp, animated: false, completion: nil)

        }else if type == .subcategory{
            popUp.category = presenter?.AllCategory() ?? []
            popUp.indexCategory = self.indexCategory
            self.present(popUp, animated: false, completion: nil)

        }else if type == .processType{
            popUp.processType = presenter?.getAllProcessType() ?? []
            self.present(popUp, animated: false, completion: nil)

        }else if type == .brand{
            if !(presenter?.getAllProcessType()[1].options?.isEmpty ?? false){
                popUp.processType = presenter?.getAllProcessType() ?? []
                self.present(popUp, animated: false, completion: nil)
            }
            
        }else if type == .transmission{
            if !( presenter?.getAllProcessType()[2].options?.isEmpty ?? false){
                popUp.processType = presenter?.getAllProcessType() ?? []
                self.present(popUp, animated: false, completion: nil)
            }
            
        }else if type == .model{
            if !(presenter?.getAllOptionType().isEmpty ?? false){
                popUp.options = presenter?.getAllOptionType() ?? []
                self.present(popUp, animated: false, completion: nil)
            }

        }else if type == .type{
            if !(presenter?.getAllOptionType().isEmpty ?? false){
                popUp.options = presenter?.getAllOptionType() ?? []
                self.present(popUp, animated: false, completion: nil)
            }
        }

    }
}



