//
//  main.swift
//  KullanıcıBilgisiTOplamaveListeleme
//
//  Created by yunus emre yıldırım on 25.11.2024.
//

import Foundation

var  kullanıcılar:[kullanıcı] = []

struct kullanıcı:CustomStringConvertible {
    var isim : String
    var yas : String
    var email : String
    
    var description: String {
        return "İsim:\(isim) Yaş:\(yas) Mail:\(email)"
    }
}

func isimAl(prompt: String) -> String {
    print(prompt)
    guard let isim = readLine(), !isim.isEmpty  else {
        print("Lütlen bir değer giriniz")
        return isimAl(prompt: prompt)
    }
    return isim
}

func yasAl(prompt: String) -> String {
    print(prompt)
    guard let girdi = readLine(), let yas = Int(girdi), yas >= 0 else {
        print("Lütfen geçerli bir yaş giriniz.")
        return yasAl(prompt: prompt)
    }
    let yasI = String(yas)
    return yasI
}

func mailAl (prompt: String) -> String{
    print(prompt)
    guard let mail = readLine(), mail.contains("@") else {
        print("Mailinizin içinde @ işeareti olmak zorunda.")
        return mailAl(prompt:prompt)
    }
    return mail
}

func kullanıcıKaydet () {
    let isim = isimAl(prompt: "İsminizi giriniz = ")
    let yas = yasAl(prompt: "Yaşınızı giriniz = ")
    let mail = mailAl(prompt: "Mailinizi giriniz = ")
    kullanıcılar.append(kullanıcı(isim: isim, yas: yas, email: mail))
    
}

//Main
print("----------Kullanıcı Veri Tabanı----------")
while true {
    print("\n1. Kullanıcı Ekle")
    print("2. Kullanıcı Listele")
    print("3. Çıkış Yap")
    
    let secim = readLine() ?? ""
    
    switch secim {
    case "1":
        kullanıcıKaydet()
        break
    case "2":
        for (sıra, listele) in kullanıcılar.enumerated() {
            print("\(sıra + 1). \(listele)")
        }
    case "3":
        print("Program kapatılıyor...")
        break
    default:
        print("Lütfen geçerli bir değer giriniz")
    }
    if secim == "3" {
        break
    }
}


