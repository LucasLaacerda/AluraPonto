//
//  Camera.swift
//  Alura Ponto
//
//  Created by Lucas Lacerda on 07/05/22.
//

import Foundation
import UIKit

protocol CameraDelegate: AnyObject {
    func didSelectFoto(_ image: UIImage)
}

class Camera: NSObject{
    
    weak var delegate: CameraDelegate?
    
    func abrirCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController){
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        
        controller.present(imagePicker, animated: true, completion: nil)
    }
    
    func abrirBibliotecaFotos(_ controller: UIViewController, _ imagePicker: UIImagePickerController){
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        controller.present(imagePicker, animated: true, completion: nil)
    }
}


extension Camera: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        guard let foto = info[.editedImage] as? UIImage else { return }
        
        delegate?.didSelectFoto(foto)

    }
}
