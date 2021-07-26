# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ViperProyectoUdemy' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ViperProyectoUdemy

  target 'ViperProyectoUdemyTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ViperProyectoUdemyUITests' do
    # Pods for testing
  end



 
 
 post_install do |installer|
 installer.pods_project.targets.each do |target|
 target.build_configurations.each do |config|
 config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
 end
 end
 end


pod 'LifevitSDK', :branch => "2.1.0", :git => "https://github.com/lifevit/ios-sdk.git"
pod 'webrtcat4', :git => 'https://github.com/seg-i2CAT/webrtcat4_ios.git', :branch => '4.0.0'
pod 'IHKeyboardAvoiding', '~> 4.6'
pod 'Toast-Swift', '~> 5.0.1'
pod 'SwiftyTimer', '~> 2.0'
pod 'Alamofire', '~> 4.9.1'
pod 'SwiftyJSON'
pod 'SDWebImage'
pod 'DropDown', '2.3.4'
pod 'Starscream'
pod 'RxSwift', '~> 4.4.0'
pod 'Firebase/Core'
pod 'Firebase/Messaging'
pod 'CVCalendar', '~> 1.7.0'
pod 'PopOverMenu'
pod 'Charts'
pod 'Kingfisher'

end
