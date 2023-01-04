//f sdf sdf  ffdsf s
//  API URls.swift
//  test app 2
//
//  Created by Ahmed on 2/10/21.
//

import Foundation

class URls{
    lazy fileprivate var Domain = "http://ayoraa.matjrx.com/api/"

    static let shared = URls()
    

    lazy var allCountriesURL = "\(Domain)client/list_countries_locales"
    lazy var loginURL = "\(Domain)client/auth/login"
    lazy var ForgotPasswordURL = "\(Domain)client/auth/forget_password"
    lazy var ResetPasswordURL = "\(Domain)client/auth/reset_password"
    lazy var ResendCodeURL = "\(Domain)client/auth/resend_code"
    lazy var verifyPhoneNumberURL = "\(Domain)client/auth/verify_phone_number"
    lazy var resendVerificationCodeURL = "\(Domain)client/auth/resend_verification_code"
    lazy var registerURL = "\(Domain)client/auth/register"
    lazy var DeleteAccountURL = "\(Domain)client/auth/delete_account"
    lazy var logoutURL = "\(Domain)client/auth/logout"
    lazy var UpdatePasswordURL = "\(Domain)client/auth/update_password"
    lazy var updateProfileURL = "\(Domain)client/auth/update_profile"
    lazy var updateAvatarURL = "\(Domain)client/auth/update_avatar"
    lazy var UserProfileURL = "\(Domain)client/auth/profile"
    
    //Home
    lazy var homeURL = "\(Domain)client/homepage"
    lazy var AllMallURL = "\(Domain)client/list_malls"
    lazy var StoreBrandURL = "\(Domain)client/list_stores"
    lazy var ListCategoryURL = "\(Domain)client/list_product_categories"
    lazy var StoreURL = "\(Domain)client/store/"
    lazy var ListProductURL = "\(Domain)client/list_products"
    lazy var CityListURL = "\(Domain)client/list_cities"
}

