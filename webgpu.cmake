include(FetchContent)

set(WEBGPU_BACKEND "WGPU" CACHE STRING "Backend implementation of WebGPU. Possible values are WGPU and DAWN (it does not matter when using emcmake)")

if (NOT TARGET webgpu)
	string(TOUPPER ${WEBGPU_BACKEND} WEBGPU_BACKEND_U)

	if (EMSCRIPTEN OR WEBGPU_BACKEND_U STREQUAL "EMSCRIPTEN")

		FetchContent_Declare(
			webgpu-backend-emscripten
			GIT_REPOSITORY https://github.com/eliemichel/WebGPU-distribution
			GIT_TAG        95fb2098a85dbb6c30f0bfcb34b327e82c7394c4
			GIT_SHALLOW    TRUE
		)
		FetchContent_MakeAvailable(webgpu-backend-emscripten)

	elseif (WEBGPU_BACKEND_U STREQUAL "WGPU")

		FetchContent_Declare(
			webgpu-backend-wgpu
			GIT_REPOSITORY https://github.com/eliemichel/WebGPU-distribution
			GIT_TAG        656e72a9abe17e837cf74fb6cd9bccd04c2a2878
			GIT_SHALLOW    TRUE
		)
		FetchContent_MakeAvailable(webgpu-backend-wgpu)

	elseif (WEBGPU_BACKEND_U STREQUAL "DAWN")

		FetchContent_Declare(
			webgpu-backend-dawn
			GIT_REPOSITORY https://github.com/eliemichel/WebGPU-distribution
			GIT_TAG        4119fdaccf70d9f4460776c956d6217e20ae16d1
			GIT_SHALLOW    TRUE
		)
		FetchContent_MakeAvailable(webgpu-backend-dawn)

	else()

		message(FATAL_ERROR "Invalid value for WEBGPU_BACKEND: possible values are WGPU and DAWN, but '${WEBGPU_BACKEND_U}' was provided.")

	endif()
endif()