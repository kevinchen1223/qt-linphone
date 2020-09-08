#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "bcg729" for configuration "Release"
set_property(TARGET bcg729 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(bcg729 PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/bcg729.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/libbcg729.dll"
  )

list(APPEND _IMPORT_CHECK_TARGETS bcg729 )
list(APPEND _IMPORT_CHECK_FILES_FOR_bcg729 "${_IMPORT_PREFIX}/lib/bcg729.lib" "${_IMPORT_PREFIX}/bin/libbcg729.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
