bazel --bazelrc=/usertools/rocm.bazelrc test --config=rocm --test_env=TF_TESTS_PER_GPU=1 --test_env=TF_GPU_COUNT=1 --test_env=HIPBLASLT_LOG_LEVEL=5  --test_env=ROCBLAS_LAYER=2 --test_env=TF_CPP_VMODULE="matmul_utils=5,cublas_lt_matmul=5,hip_blas_lt=5"  \
--flaky_test_attempts=1 \
--test_env=MIOPEN_ENABLE_LOGGING_CMD=1 \
--test_env=MIOPEN_LOG_LEVEL=7 \
--test_env=MIOPEN_DEBUG_CONV_WINOGRAD=0 \
--test_env=MIOPEN_DEBUG_CONV_GEMM=0 \
--test_env=MIOPEN_DEBUG_CONV_IMPLICIT_GEMM=0 \
--test_env=MIOPEN_DEBUG_CONV_FFT=0 \
--test_env=MIOPEN_DEBUG_CONV_DIRECT=1 \
   --run_under=//tools/ci_build/gpu_build:parallel_gpu_execute -- //xla/tests:convolution_test_gpu 2>&1 | tee convolution_test_gpu.log  


