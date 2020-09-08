############################################################################
# Bcg729Config.cmake
# Copyright (C) 2015  Belledonne Communications, Grenoble France
#
############################################################################
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
############################################################################
#
# Config file for the bcg729 package.
# It defines the following variables:
#
#  BCG729_FOUND - system has bcg729
#  BCG729_INCLUDE_DIRS - the bcg729 include directory
#  BCG729_LIBRARIES - The libraries needed to use bcg729
#  BCG729_CPPFLAGS - The compilation flags needed to use bcg729


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Bcg729Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

include("${CMAKE_CURRENT_LIST_DIR}/Bcg729Targets.cmake")

if(YES)
	set(BCG729_TARGETNAME bcg729)
	set(BCG729_LIBRARIES ${BCG729_TARGETNAME})
else()
	set(BCG729_TARGETNAME bcg729-static)
	if(TARGET ${BCG729_TARGETNAME})
		if(LINPHONE_BUILDER_GROUP_EXTERNAL_SOURCE_PATH_BUILDERS)
			set(BCG729_LIBRARIES ${BCG729_TARGETNAME})
		else()
			get_target_property(BCG729_LIBRARIES ${BCG729_TARGETNAME} LOCATION)
		endif()
		get_target_property(BCG729_LINK_LIBRARIES ${BCG729_TARGETNAME} INTERFACE_LINK_LIBRARIES)
		if(BCG729_LINK_LIBRARIES)
			list(APPEND BCG729_LIBRARIES ${BCG729_LINK_LIBRARIES})
		endif()
	endif()
endif()
get_target_property(BCG729_INCLUDE_DIRS ${BCG729_TARGETNAME} INTERFACE_INCLUDE_DIRECTORIES)
if (NOT BCG729_INCLUDE_DIRS)
	set (BCG729_INCLUDE_DIRS)
endif()

list(INSERT BCG729_INCLUDE_DIRS 0 "D:/work/x2/linphone-sdk/build/linphone-sdk/desktop/include")

list(REMOVE_DUPLICATES BCG729_INCLUDE_DIRS)

set(BCG729_CPPFLAGS )
set(BCG729_FOUND 1)
