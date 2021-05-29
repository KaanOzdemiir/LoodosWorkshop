# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LoodosWorkshop' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LoodosWorkshop
pod 'Alamofire', '~> 5.0.0-rc.2'
pod 'AlamofireObjectMapper'
pod 'AlamofireNetworkActivityLogger'
pod 'RxBus'
pod 'RxSwift'
pod 'RxCocoa'
pod 'Kingfisher', '~> 5.0'
pod 'Firebase/Analytics'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
pod 'Hero'
pod 'Shimmer'
pod 'Firebase/RemoteConfig'
pod 'lottie-ios'
end

deployment_target = '11.0'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            end
        end
        project.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        end
    end
end
