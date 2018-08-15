#
# Be sure to run `pod lib lint XWHUDManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XWHUDManager'
  s.version          = '0.1.2'
  s.summary          = 'MBProgressHUD 封装'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/qxuewei/XWHUDManager'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qxuewei' => 'qiuxuewei@peiwo.cn' }
  s.source           = { :git => 'https://github.com/qxuewei/XWHUDManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/qxuewei'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XWHUDManager/MBProgressHUD+XW.{h,m}'
  
  s.resource_bundles = {
     'XWHUDManager' => ['XWHUDManager/XWHUDImages.bundle']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'MBProgressHUD', '~> 1.1.0'

end
