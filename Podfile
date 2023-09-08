# Uncomment the next line to define a global platform for your project
# platform :ios, '10'

target 'Fashions' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'


  # Pods for Fashions
#pod 'Alamofire' , :modular_headers => true
pod 'FirebaseCore' , :modular_headers => true
pod 'FirebaseAuth' , :modular_headers => true
pod 'GoogleSignIn' , :modular_headers => true
pod 'IQKeyboardManagerSwift'

pod 'SQLite.swift'



 
  pod 'Firebase', :modular_headers => true
  pod 'FirebaseCoreInternal', :modular_headers => true
  pod 'GoogleUtilities', :modular_headers => true

end
post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
               end

          end
   end
end

