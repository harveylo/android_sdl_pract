if (NOT EXISTS "/home/harveylwo/android_sdl_pract/app/.cxx/RelWithDebInfo/1t2v3q20/arm64-v8a/install_manifest.txt")
    message(FATAL_ERROR "Cannot find install manifest: \"/home/harveylwo/android_sdl_pract/app/.cxx/RelWithDebInfo/1t2v3q20/arm64-v8a/install_manifest.txt\"")
endif()

file(READ "/home/harveylwo/android_sdl_pract/app/.cxx/RelWithDebInfo/1t2v3q20/arm64-v8a/install_manifest.txt" files)
string(REGEX REPLACE "\n" ";" files "${files}")
foreach(file ${files})
    message(STATUS "Uninstalling \"$ENV{DESTDIR}${file}\"")
    execute_process(
        COMMAND /home/harveylwo/android_sdk_root/cmake/3.22.1/bin/cmake -E remove "$ENV{DESTDIR}${file}"
        OUTPUT_VARIABLE rm_out
        RESULT_VARIABLE rm_retval
    )
    if(NOT ${rm_retval} EQUAL 0)
        message(FATAL_ERROR "Problem when removing \"$ENV{DESTDIR}${file}\"")
    endif (NOT ${rm_retval} EQUAL 0)
endforeach()
