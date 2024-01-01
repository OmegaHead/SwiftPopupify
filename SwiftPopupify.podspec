#
# Be sure to run `pod lib lint SwiftPopupify.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftPopupify'
  s.version          = '0.1.0'
  s.summary          = 'A library for handling popups in Swift applications.'
  s.description = 'SwiftPopupify is a versatile and easy-to-use Swift library that empowers developers to effortlessly integrate and manage popups in their iOS applications. With SwiftPopupify, creating interactive and visually appealing popups becomes a breeze, enhancing user experience and engagement.

  Key Features:
  - **Simple Integration:** Seamlessly integrate popups into your Swift projects with minimal code.
  - **Customization:** Enjoy full control over the appearance and behavior of your popups, allowing for a tailored user interface.
  - **Animation Effects:** Add eye-catching animation effects to your popups, creating a dynamic and engaging user experience.
  - **Flexible Triggers:** Define various triggers for popups, such as button taps, gestures, or time-based events.
  - **Responsive Design:** SwiftPopupify adapts to different screen sizes and orientations, ensuring a consistent and responsive presentation.
  
  Whether you need to display informative messages, gather user input, or showcase rich media content, SwiftPopupify simplifies the process, saving you development time while delivering a polished and interactive UI.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/OmegaHead/SwiftPopupify'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OmegaHead' => 'mishachupa2015@outlook.com' }
  s.source           = { :git => 'https://github.com/OmegaHead/SwiftPopupify.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.ios.deployment_target = '13.0'

  s.source_files = 'Classes/**/*'

end
