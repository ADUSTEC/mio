include(CMakeDependentOption)

CMAKE_DEPENDENT_OPTION(mio.windows.full_api
  "Configure mio without WIN32_LEAN_AND_MEAN and NOMINMAX definitions"
  OFF "WIN32" ON)

include("${CMAKE_CURRENT_LIST_DIR}/mio-targets.cmake")

if(NOT mio.windows.full_api)
  set_property(TARGET mio::mio APPEND PROPERTY INTERFACE_COMPILE_DEFINITIONS
    WIN32_LEAN_AND_MEAN
    NOMINMAX)
endif()
