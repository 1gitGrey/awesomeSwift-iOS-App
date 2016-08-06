source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'AwesomeSwift' do
    pod 'Crashlytics' # Crash handler
    pod 'DGElasticPullToRefresh_CanStartLoading' # Elastic Pull refresh
    pod 'SimpleAnimation'
    pod 'Fabric' # Crash handler
    pod 'Debug' # Logging w/ colors
    pod 'RAMAnimatedTabBarController'
    pod 'SwiftDate' # Data handler
    pod 'SwiftyMarkdown'
    pod 'SwiftyJSON' # JSON handler
    pod 'SwiftyUserDefaults'
    pod 'AlamofireUIManager'
    pod 'AlamofireRouter'
    pod 'UITableViewCellManager'
    pod 'SwiftyJSONRealmObject'
    pod 'RealmSwift'
    pod 'StoryboardEnum'
end

def testing_pods
    pod 'Nimble' # BDD
    pod 'Quick' # BDD
    pod 'RealmSwift' # Local database
end

target 'AwesomeSwiftTests' do
    testing_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Debug'
            target.build_configurations.each do |config|
                if config.name == 'Debug'
                    config.build_settings['OTHER_SWIFT_FLAGS'] = '-DDEBUG'
                    else
                    config.build_settings['OTHER_SWIFT_FLAGS'] = ''
                end
            end
        end
    end
end

