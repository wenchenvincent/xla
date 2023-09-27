bazel --bazelrc=/usertools/rocm.bazelrc test --config=rocm --test_env=TF_TESTS_PER_GPU=1 --test_env=TF_GPU_COUNT=1 --test_env=HIPBLASLT_LOG_LEVEL=5  --test_env=ROCBLAS_LAYER=2 --test_env=TENSILE_DB=0x8000    --test_env=TF_CPP_VMODULE="matmul_utils=5,cublas_lt_matmul=5,hip_blas_lt=5"  \
--flaky_test_attempts=1 \
   --run_under=//tools/ci_build/gpu_build:parallel_gpu_execute -- //xla/tests:dot_operation_test_gpu 2>&1 | tee dot_operation_test_gpu.log


