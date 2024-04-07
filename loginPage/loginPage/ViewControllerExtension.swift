import Foundation

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}

extension ViewController {
    
    func createMainStackView() {
        
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:0).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 28).isActive = true
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.spacing = 30
    }
    
    func createLockImage() {
        
        let lockImage = UIImageView(image: UIImage(systemName: "lock.laptopcomputer"))
        lockImage.tintColor = .black
        lockImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        lockImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lockImage.contentMode = .scaleAspectFit
        mainStackView.addArrangedSubview(lockImage)
    }
    
    func createWelcomeStackView() {
        
        mainStackView.addArrangedSubview(welcomeStackView)
        welcomeStackView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        welcomeStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        welcomeStackView.addArrangedSubview(createWelcomeLabel())
    }
    
    func createWelcomeLabel() -> UILabel {
        
        let welcomeLabel = UILabel()
        let text = "მოგესალმებით!\nამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპი. პკ."
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .paragraphStyle: paragraphStyle
        ]
        
        let nsText = NSMutableAttributedString(string: text, attributes: attributes)
        let firstWordsRange = (text as NSString).range(of: "მოგესალმებით!")
        nsText.addAttributes([.font: UIFont.boldSystemFont(ofSize: 24)], range: firstWordsRange)
        
        welcomeLabel.attributedText = nsText
        welcomeLabel.numberOfLines = 7
        welcomeLabel.textAlignment = .left
        
        return welcomeLabel
    }
    
    func createAuthorisationStackView() {
        
        let authorisationMainStackView = UIStackView()
        mainStackView.addArrangedSubview(authorisationMainStackView)
        authorisationMainStackView.translatesAutoresizingMaskIntoConstraints = false

        authorisationMainStackView.heightAnchor.constraint(equalToConstant: 528).isActive = true
        authorisationMainStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        authorisationMainStackView.axis = .vertical
        authorisationMainStackView.alignment = .fill
        authorisationMainStackView.distribution = .fill
        authorisationMainStackView.spacing = 4
        
        let authorisationLabel = UILabel()
        authorisationLabel.text = "ავტორიზაცია"
        authorisationLabel.font = UIFont(name: "Sylfaen", size: 22)
        authorisationLabel.textAlignment = .center
        authorisationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let bottomBorderView = UIView()
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = false
        bottomBorderView.backgroundColor = UIColor(red: 51/255, green: 165/255, blue: 229/255, alpha: 1.0)
        bottomBorderView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomBorderView.widthAnchor.constraint(equalToConstant: 326).isActive = true
        authorisationLabel.font = authorisationLabel.font.withSize(14)
        
        let labelForInput = createLabelForInput(text: "სახელი გვარი")
        let input1 = createInputField(placeholder: "დრეიკი დრეიკი")
        let labelForInput2 = createLabelForInput(text: "ელ-ფოსტა")
        input2 = createInputField(placeholder: "lisanAlHAAAAIB@paul.com")
        input3 = createInputField(placeholder: "მე და ჯ.კოული>>კენდრიკი", isSecuredText: true)
        let labelForInput3 = createLabelForInput(text: "პაროლი")
        
        let signInButton = createSignInButton()
        let signInWithFb = createSignInButton()
        let signInWithGoogle = createSignInButton()
        
        signInWithFb.setTitle("გამოიყენეთ ფეისბუქი", for: .normal)
        signInWithFb.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        signInWithGoogle.setTitleColor(.black, for: .normal)
        signInWithGoogle.setTitle("გამოიყენეთ გუგლი", for: .normal)
        signInWithGoogle.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        signInWithFb.setTitleColor(.black, for: .normal)
        signInWithFb.setImage(UIImage(systemName: "f.circle.fill"), for: .normal)
        signInWithGoogle.setImage(UIImage(systemName: "g.circle.fill"), for: .normal)
        
        let dividerStackView = UIStackView()
        dividerStackView.axis = .horizontal
        dividerStackView.alignment = .center
        dividerStackView.distribution = .equalSpacing
        
        let halfBorder1 = createDividerView()
        let halfBorder2 = createDividerView()
        let orLabel = UILabel()
        orLabel.text = "ან"
        
        dividerStackView.addArrangedSubviews(halfBorder1, orLabel, halfBorder2)
        
        let emptyView = UIView()
        
        authorisationMainStackView.addArrangedSubviews(authorisationLabel, bottomBorderView, labelForInput, input1, labelForInput2, input2, labelForInput3, input3, signInButton, dividerStackView, signInWithGoogle, signInWithFb, emptyView)
        
        if let border = authorisationMainStackView.arrangedSubviews.firstIndex(of: bottomBorderView) {
            authorisationMainStackView.setCustomSpacing(24, after: authorisationMainStackView.arrangedSubviews[border])
        }
        
        if let inputField3Index = authorisationMainStackView.arrangedSubviews.firstIndex(of: input3) {
            authorisationMainStackView.setCustomSpacing(16, after: authorisationMainStackView.arrangedSubviews[inputField3Index])
        }
        
        if let inputFieldIndex = mainStackView.arrangedSubviews.firstIndex(of: welcomeStackView) {
            mainStackView.setCustomSpacing(20, after: mainStackView.arrangedSubviews[inputFieldIndex])
        }
        
        if let inputLabel1Index = authorisationMainStackView.arrangedSubviews.firstIndex(of: authorisationLabel) {
            authorisationMainStackView.setCustomSpacing(10, after: authorisationMainStackView.arrangedSubviews[inputLabel1Index])
        }
        
    }
    
    func createDividerView() -> UIView {
        
        let halfBorder = UIView()
        halfBorder.translatesAutoresizingMaskIntoConstraints = false
        halfBorder.widthAnchor.constraint(equalToConstant: 140).isActive = true
        halfBorder.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        halfBorder.backgroundColor = .gray
        
        return halfBorder
    }
    
    func createLabelForInput(text: String) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.font = label.font.withSize(12)
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        return label
    }
    
    
    func createInputField(placeholder: String, isSecuredText: Bool = false) -> UITextField {
        
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = placeholder
        input.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        input.isSecureTextEntry = isSecuredText
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 5
        input.clipsToBounds = true
        input.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0).cgColor
        input.heightAnchor.constraint(equalToConstant: 44).isActive = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: input.frame.height))
        input.leftView = paddingView
        input.leftViewMode = .always
        
        return input
    }
    
    func createSignInButton() -> UIButton {
        
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.layer.backgroundColor = UIColor(red: 51/255, green: 165/255, blue: 229/255, alpha: 1.0).cgColor
        signInButton.layer.cornerRadius = 12
        signInButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        signInButton.setTitle("შესვლა", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonPressed(_:)), for: .touchUpInside)
        
        return signInButton
    }
    
    func validatePassword(input: UITextField) {
        
        if input.text!.count < 6 || input.text!.count > 15 {
            input.layer.borderColor = UIColor(.red).cgColor
        }
        else {
            input.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0).cgColor
        }
    }
    
    func validateEmail(input: UITextField, email: String) {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        if !isEmailValid {
            input.layer.borderColor = UIColor.red.cgColor
        } else {
            input.layer.borderColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0).cgColor
        }
    }
    
    @objc func signInButtonPressed(_ sender: UIButton) {
        
        if let input = input3 {
            validatePassword(input: input)
        } else {
            print("input3 is nil")
        }
        
        if let email = input2 {
            guard let emailText = email.text else {
                print("email is nil")
                return
            }
            validateEmail(input: email, email: emailText)
        }
    }
    
}

#Preview {
    ViewController()
}
