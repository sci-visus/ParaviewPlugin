set(SOURCES
  avtIDXFileFormat.C
  avtIDXOptions.C
  pidx_idx_io.cpp
  uintah_utils.cpp
  IDXPluginInfo.C
  IDXCommonPluginInfo.C
  IDXEnginePluginInfo.C
  IDXMDServerPluginInfo.C
 )

if(HAVE_LIBPIDX)
  ADD_VISIT_READER(VisItIDXReader "1.0"
    VISIT_READER_TYPE "MTMD"
    VISIT_READER_NAME "avtIDXFileFormat"
    VISIT_READER_USES_OPTIONS ON
    SERVER_SOURCES ${SOURCES}
    )
endif(HAVE_LIBPIDX)

