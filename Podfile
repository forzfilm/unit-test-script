# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'Example1.xcworkspace'
project 'Example1.xcodeproj'

def keyboard_pods
  pod 'IQKeyboardManagerSwift'
end

def requestAPI_pod
  pod 'RequestAPI', :path => 'Modulars/RequestAPI'
end

def toDoList_pod
  pod 'ToDoList', :path => 'Modulars/ToDoList', :testspecs => ['ToDoListTests']
end

def networking_pod
  pod 'Networking', :path => 'Modulars/Networking'
end

target 'Example1' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  keyboard_pods
  requestAPI_pod
  toDoList_pod
  networking_pod

  target 'Example1Tests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Example1UITests' do
    # Pods for testing
  end

end

target 'RequestAPI_Example' do
  project 'Modulars/RequestAPI/RequestAPI.xcodeproj'
  requestAPI_pod
end

target 'ToDoList_Example' do
  project 'Modulars/ToDoList/ToDoList.xcodeproj'
  toDoList_pod
end

target 'Networking_Example' do
  project 'Modulars/Networking/Networking.xcodeproj'
  networking_pod
end