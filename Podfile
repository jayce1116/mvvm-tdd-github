# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'


def pods
  pod 'RxCocoa'
  pod 'RxSwift'
  pod 'Alamofire'
  pod 'RxAlamofire'
  pod 'RxDataSources'
end

target 'mvvm-tdd-github' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pods

  # Pods for mvvm-tdd-github

  target 'mvvm-tdd-githubTests' do
    inherit! :search_paths
    # Pods for testing
    pods
    pod 'RxBlocking'
    pod 'RxTest'
  end

  target 'mvvm-tdd-githubUITests' do
    # Pods for testing
    pods
  end

end
