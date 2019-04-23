#/*****************************************************
# **  PIDX Parallel I/O Library                      **
# **  Copyright (c) 2010-2014 University of Utah     **
# **  Scientific Computing and Imaging Institute     **
# **  72 S Central Campus Drive, Room 3750           **
# **  Salt Lake City, UT 84112                       **
# **                                                 **
# **  PIDX is licensed under the Creative Commons    **
# **  Attribution-NonCommercial-NoDerivatives 4.0    **
# **  International License. See LICENSE.md.         **
# **                                                 **
# **  For information about this project see:        **
# **  http://www.cedmav.com/pidx                     **
# **  or contact: pascucci@sci.utah.edu              **
# **  For support: PIDX-support@visus.net            **
# **                                                 **
# *****************************************************/


# This module finds if PIDX is installed, and sets the following variables
# indicating where it is:
#
# PIDX_FOUND               - system has PIDX
# PIDX_INCLUDE_DIR         - path to PIDX include directory
# PIDX_LIBRARIES           - all PIDX libraries
#
# Execute cmake with "-DPIDX_DIR=/path/to/pidx" to help find the library.
#

IF (PIDX_DIR)
  FIND_PATH(PIDX_INCLUDE_DIR NAMES PIDX.h PATHS ${PIDX_DIR}/include NO_DEFAULT_PATH)
  FIND_PATH(HDF5_INCLUDE_DIR NAMES PIDX.h)

  IF (PIDX_INCLUDE_DIR)
    
    SET(PIDX_INCLUDE_DIRS "${PIDX_INCLUDE_DIR}")

    FIND_LIBRARY(PIDX_LIBRARY                pidx                PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_AGG_LIBRARY            pidx_agg            PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_BLOCK_RST_LIBRARY      pidx_block_rst      PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_CMP_LIBRARY            pidx_cmp            PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_COMM_LIBRARY           pidx_comm           PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_CORE_LIBRARY           pidx_core           PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_DATA_HANDLE_LIBRARY    pidx_data_handle    PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_FILE_IO_LIBRARY        pidx_file_io        PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_HEADER_LIBRARY         pidx_header         PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_HZ_LIBRARY             pidx_hz             PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_IDX_IO_LIBRARY         pidx_idx_io         PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_IDX_RST                pidx_idx_rst        PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_IO_LIBRARY             pidx_io             PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_METADATA_LIBRARY       pidx_metadata       PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_PARTICLE_IO_LIBRARY    pidx_particle_io    PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_PARTICLES_RST_LIBRARY  pidx_particles_rst  PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_RAW_IO_LIBRARY         pidx_raw_io         PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_RAW_RST_LIBRARY        pidx_raw_rst        PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_UTILS_LIBRARY          pidx_utils          PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
    FIND_LIBRARY(PIDX_ZFP_LIBRARY            zfp                 PATHS ${PIDX_DIR}/lib NO_DEFAULT_PATH)
  
    SET(PIDX_LIBRARIES 
      ${PIDX_LIBRARY}
      ${PIDX_AGG_LIBRARY}
      ${PIDX_BLOCK_RST_LIBRARY}
      ${PIDX_CMP_LIBRARY}
      ${PIDX_COMM_LIBRARY}
      ${PIDX_DATA_HANDLE_LIBRARY}
      ${PIDX_FILE_IO_LIBRARY}
      ${PIDX_HEADER_LIBRARY}
      ${PIDX_HZ_LIBRARY}
      ${PIDX_IDX_IO_LIBRARY}
      ${PIDX_IDX_RST}
      ${PIDX_IO_LIBRARY}
      ${PIDX_METADATA_LIBRARY}
      ${PIDX_PARTICLE_IO_LIBRARY}
      ${PIDX_PARTICLES_RST_LIBRARY}
      ${PIDX_RAW_IO_LIBRARY}
      ${PIDX_RAW_RST_LIBRARY}
      ${PIDX_UTILS_LIBRARY}
      ${PIDX_ZFP_LIBRARY}
    )

    SET(PIDX_FOUND   true CACHE BOOL "PIDX library found" FORCE)
    SET(HAVE_LIBPIDX true CACHE BOOL "Have PIDX library" FORCE)

    IF (CMAKE_VERBOSE_MAKEFILE)
      MESSAGE("Using PIDX_INCLUDE_DIR  = ") 
      FOREACH(inc ${PIDX_INCLUDE_DIR})
        MESSAGE("  " ${inc})
      ENDFOREACH()
      MESSAGE("Found PIDX_LIBRARIES    = ")
      FOREACH(lib ${PIDX_LIBRARIES})
        MESSAGE("  " ${lib})
      ENDFOREACH()
    ENDIF (CMAKE_VERBOSE_MAKEFILE)

  ELSE ()
    IF (PIDX_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "PIDX library not found. Try setting PIDX_DIR")
    ELSE()
      MESSAGE(STATUS "PIDX library not found. Try setting PIDX_DIR")
    ENDIF()
  ENDIF ()
ELSE ()
  SET(PIDX_DIR  "" CACHE PATH "PIDX library directory")
  MESSAGE(FATAL_ERROR "PIDX Directory not found. Try setting PIDX_DIR")
ENDIF ()                     
