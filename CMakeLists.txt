cmake_minimum_required(VERSION 3.16)

project(
  BasicApp
  VERSION 0.1
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appBasicApp main.cpp)

qt_add_qml_module(
  appBasicApp
  URI
  BasicApp
  VERSION
  1.0
  QML_FILES
  Main.qml)

set_target_properties(
  appBasicApp
  PROPERTIES MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBasicApp
			 MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
			 MACOSX_BUNDLE_SHORT_VERSION_STRING
			 ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
			 MACOSX_BUNDLE TRUE
			 WIN32_EXECUTABLE TRUE)

target_link_libraries(appBasicApp PRIVATE Qt6::Quick)

qt_generate_deploy_qml_app_script(
  TARGET
  appBasicApp
  OUTPUT_SCRIPT
  deploy_script
  MACOS_BUNDLE_POST_BUILD
  NO_UNSUPPORTED_PLATFORM_ERROR
  DEPLOY_USER_QML_MODULES_ON_UNSUPPORTED_PLATFORM)

include(GNUInstallDirs)
install(
  TARGETS appBasicApp
  BUNDLE DESTINATION .
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
