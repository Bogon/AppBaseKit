#
# Be sure to run `pod lib lint AppBaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppBaseKit'
  s.version          = '1.1.2'
  s.summary          = 'A handy kit of Swift extensions and wrapped class to boost your productivity.'
  s.swift_version    = '4.0'
  
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A handy kit of Swift extensions and wrapped class to boost your productivity.这一个针对iOS版本的手机崩溃的扩展框架，主要是针对UIKit和Foundation的扩展。
                       '

  s.homepage         = 'https://github.com/Bogon/AppBaseKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bogon' => 'zhangqixcu@gmail.com' }
  s.source           = { :git => 'https://github.com/Bogon/AppBaseKit.git', :tag => s.version.to_s }
  #s.social_media_url = 'https://twitter.com/zixun_'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AppBaseKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AppBaseKit' => ['AppBaseKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
