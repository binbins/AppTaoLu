#
# Be sure to run `pod lib lint AppTaoLu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AppTaoLu'
  s.version          = '0.2.5'
  s.summary          = 'app 中可以共用的弹框'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/binbins/AppTaoLu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'binbins' => 'gddabinbin@gmail.com' }
  s.source           = { :git => 'https://github.com/binbins/AppTaoLu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AppTaoLu/Classes/**/*'

# target membership问题，先不用下边的方法打包资源文件
# s.resource_bundles = {
#    'AppTaoLu' => ['AppTaoLu/Assets/*.png']
# }

s.resources = ['AppTaoLu/Assets/*.png'];

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'TLRemoteConfig', '~> 0.1.1'
  s.dependency 'SDWebImage'






end
