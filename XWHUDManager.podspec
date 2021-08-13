#
# Be sure to run `pod lib lint XWHUDManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XWHUDManager'
  s.version          = '0.4.0'
  s.summary          = 'MBProgressHUD 封装.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  MBProgressHUD 封装, 支持菊花, 提示语, 成功失败提示信息, 支持序列帧, Gif等, 支持自定义, 相当好用
                       DESC

  s.homepage         = 'https://github.com/qxuewei/XWHUDManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qxuewei' => 'qxuewei@yeah.net' }
  s.source           = { :git => 'https://github.com/qxuewei/XWHUDManager.git', :tag => s.version.to_s }
  s.social_media_url = 'http://www.qiuxuewei.com'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XWHUDManager/Classes/**/*'
  
  s.resource_bundles = {
     'XWHUDManager' => ['XWHUDManager/Assets/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'MBProgressHUD', '~> 1.1.0'
end
