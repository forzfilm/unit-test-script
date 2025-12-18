BUILD_PATH="build"

if [ -d "$BUILD_PATH" ]; then
  echo "BUILD_PATH exists. Removing $BUILD_PATH"
  rm -rf "$BUILD_PATH"
else
  echo "BUILD_PATH does not exist. Nothing to remove."
fi

XCOV_PATH="xcov_report"

if [ -d "$XCOV_PATH" ]; then
  echo "XCOV_PATH exists. Removing $XCOV_PATH"
  rm -rf "$XCOV_PATH"
else
  echo "XCOV_PATH does not exist. Nothing to remove."
fi

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