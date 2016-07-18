source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target 'AwesomeSwift' do
    pod 'Crashlytics' # Crash handler
    pod 'DGElasticPullToRefresh_CanStartLoading' # Elastic Pull refresh
    pod 'SimpleAnimation'
    pod 'Fabric' # Crash handler
    pod 'SwiftyBeaver' # Logging w/ colors
    pod 'RAMAnimatedTabBarController'
    pod 'SwiftDate' # Data handler
    pod 'SwiftyMarkdown'
    pod 'SwiftyJSON' # JSON handler
    pod 'SwiftyUserDefaults'
    pod 'AlamofireUIManager'
    pod 'AlamofireRouter', '~> 0.1'
    pod 'UITableViewCellManager', '~> 0.1'
    pod 'SwiftyJSONRealmObject', '~> 0.1'
    pod 'RealmSwift'
end

def testing_pods
    pod 'Nimble' # BDD
    pod 'Quick' # BDD
    pod 'RealmSwift' # Local database
end

target 'AwesomeSwiftTests' do
    testing_pods
end

