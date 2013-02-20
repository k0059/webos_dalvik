set(local_c_includes
	${openssl_INCLUDE_DIR} 
	${openssl_INCLUDE_DIR}/include 
	${openssl_INCLUDE_DIR}/crypto
    )

set(local_src_files
	ssl/bio_ssl.c 
	ssl/d1_both.c 
	ssl/d1_enc.c 
	ssl/d1_lib.c 
	ssl/d1_pkt.c 
	ssl/d1_srtp.c 
	ssl/kssl.c 
	ssl/s23_clnt.c 
	ssl/s23_lib.c 
	ssl/s23_meth.c 
	ssl/s23_pkt.c 
	ssl/s23_srvr.c 
	ssl/s2_clnt.c 
	ssl/s2_enc.c 
	ssl/s2_lib.c 
	ssl/s2_meth.c 
	ssl/s2_pkt.c 
	ssl/s2_srvr.c 
	ssl/s3_both.c 
	ssl/s3_cbc.c 
	ssl/s3_clnt.c 
	ssl/s3_enc.c 
	ssl/s3_lib.c 
	ssl/s3_meth.c 
	ssl/s3_pkt.c 
	ssl/s3_srvr.c 
	ssl/ssl_algs.c 
	ssl/ssl_asn1.c 
	ssl/ssl_cert.c 
	ssl/ssl_ciph.c 
	ssl/ssl_err.c 
	ssl/ssl_err2.c 
	ssl/ssl_lib.c 
	ssl/ssl_rsa.c 
	ssl/ssl_sess.c 
	ssl/ssl_stat.c 
	ssl/ssl_txt.c 
	ssl/t1_clnt.c 
	ssl/t1_enc.c 
	ssl/t1_lib.c 
	ssl/t1_meth.c 
	ssl/t1_reneg.c 
	ssl/t1_srvr.c 
	ssl/tls_srp.c
    )

concat(local_c_includes ${log_c_includes})

# TODO: Don't think we need this
#concat(local_additional_dependencies ${LOCAL_PATH}/webos-config.cmake ${LOCAL_PATH}/Ssl.cmake)

#######################################
# target static library
# Save build time, skip _static
# CLEAR_VARS()
# android_include(webos-config.cmake)
# 
# #ifneq (,$(TARGET_BUILD_APPS))
# #LOCAL_SDK_VERSION := 9
# #endif
# 
# concat(LOCAL_SRC_FILES ${local_src_files})
# concat(LOCAL_C_INCLUDES ${local_c_includes})
# set(LOCAL_SHARED_LIBRARIES ${log_shared_libraries})
# set(LOCAL_MODULE_TAGS optional)
# set(LOCAL_MODULE ssl_static)
# set(LOCAL_ADDITIONAL_DEPENDENCIES := ${local_additional_dependencies})
# BUILD_STATIC_LIBRARY()

#######################################
# target shared library
CLEAR_VARS()
android_include(webos-config.cmake)

#ifneq (,$(TARGET_BUILD_APPS))
#LOCAL_SDK_VERSION := 9
#endif

concat(LOCAL_SRC_FILES ${local_src_files})
concat(LOCAL_C_INCLUDES ${local_c_includes})
set(LOCAL_SHARED_LIBRARIES crypto ${log_shared_libraries})
set(LOCAL_MODULE_TAGS optional)
set(LOCAL_MODULE ssl)
set(LOCAL_ADDITIONAL_DEPENDENCIES := ${local_additional_dependencies})
BUILD_SHARED_LIBRARY()

# #######################################
# # host shared library
# include $(CLEAR_VARS)
# include $(LOCAL_PATH)/android-config.mk
# LOCAL_SRC_FILES += $(local_src_files)
# LOCAL_C_INCLUDES += $(local_c_includes)
# LOCAL_SHARED_LIBRARIES += libcrypto $(log_shared_libraries)
# LOCAL_MODULE_TAGS := optional
# LOCAL_MODULE:= libssl
# LOCAL_ADDITIONAL_DEPENDENCIES := $(local_additional_dependencies)
# include $(BUILD_HOST_SHARED_LIBRARY)
# 
# #######################################
# # ssltest
# include $(CLEAR_VARS)
# include $(LOCAL_PATH)/android-config.mk
# LOCAL_SRC_FILES:= ssl/ssltest.c
# LOCAL_C_INCLUDES += $(local_c_includes)
# LOCAL_SHARED_LIBRARIES := libssl libcrypto $(log_shared_libraries)
# LOCAL_MODULE:= ssltest
# LOCAL_MODULE_TAGS := optional
# LOCAL_ADDITIONAL_DEPENDENCIES := $(local_additional_dependencies)
# include $(BUILD_EXECUTABLE)
# 
