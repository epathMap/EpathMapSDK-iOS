#
# Be sure to run `pod lib lint EpathmapSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EpathmapSDK'
  s.version          = '0.1.0'
  s.summary          = '释途室内地图导航SDK'


  s.description      = <<-DESC
室内导航 EpathmapSDK Indoor navigation map ibeacon buildings
                       DESC

  s.homepage         = 'https://github.com/epathMap/EpathmapSDK-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'epathMap' => 'wanggf@e-path.cn' }
  s.source           = { :git => 'https://github.com/epathMap/EpathmapSDK-iOS.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
#  s.source_files = 'Pod/EpathmapSDK/Classes/*.{h,m,}'

  # s.resource_bundles = {
  #   'EpathmapSDK' => ['EpathmapSDK/Assets/*.png']
  # }
  #s.resources = "EpathmapSDK/EpathmapSDK.xcassets"
  #s.public_header_files = 'Pod/Classes/**/*.h'
  s.vendored_frameworks = 'EpathmapSDK-iOS/EpathmapSDK.framework'
  # s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = "UIKit", "Foundation", "QuartzCore", "SystemConfiguration", "CoreGraphics", "CoreLocation", "CoreTelephony", "AudioToolbox", "AVFoundation", "AddressBook"
  s.weak_framework = "Contacts"
  # s.library   = "iconv"
  s.libraries = "z", "z.1.2.5", "xml2"

  #s.dependency 'AFNetworking', '~> 2.3'
#  s.dependency "Bugly", "~> 2.4.7"
#  s.dependency "Mixpanel", "~> 3.1.3"
#  s.dependency "Parse", "~> 1.14.4"
#  s.dependency "SDWebImage", "~> 3.8.2"
#  s.dependency "SVProgressHUD", "~> 2.1.2"
end
