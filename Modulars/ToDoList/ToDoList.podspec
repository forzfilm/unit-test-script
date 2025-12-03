#
# Be sure to run `pod lib lint BizNextResources.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ToDoList'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ToDoList.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/forzfilm/ToDoList'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'forzfilm' => 'https://github.com/forzfilm' }
  s.source           = { :git => 'https://github.com/forzfilm/ToDoList.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '16.0'
  
  s.source_files = 'ToDoList/**/*.{swift,xib}'
  s.resources = 'ToDoList/**/*.{json}'
  s.dependency 'IQKeyboardCore'
  s.dependency 'IQKeyboardManagerSwift'
  s.dependency 'IQKeyboardNotification'
  s.dependency 'IQKeyboardToolbar'
  s.dependency 'IQKeyboardToolbarManager'
  s.dependency 'IQTextInputViewNotification'
  s.dependency 'IQTextView'

  s.test_spec 'ToDoListTests' do |test_spec|
    test_spec.source_files = 'ToDoListTests/*.{swift}'
  end
end
