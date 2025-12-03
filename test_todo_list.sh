xcodebuild test \
  -workspace Example1.xcworkspace \
  -scheme "ToDoList_Example" \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 16 Pro,OS=18.4' \
  -enableCodeCoverage YES \
  -resultBundlePath build/Test.xcresult

  xcov \
  --workspace Example1.xcworkspace \
  --scheme ToDoList_Example \
  --include_targets "ToDoList.framework" \
  --ignore_file_path .xcovignore