LIBRARY()

NO_WERROR()



SRCS(
    kernel/pointwise_hist2.cu
    kernel/pointwise_scores.cu
    histograms_helper.cpp
    pointwise_kernels.cpp
    oblivious_tree.cpp
    oblivious_tree_structure_searcher.cpp
    oblivious_tree_leaves_estimator.cpp
    boosting.cpp
    boosting_listeners.cpp
    boosting_options.cpp
    bootstrap.cpp
    tree_ctrs.cpp
)

PEERDIR(
    catboost/cuda/models
    catboost/cuda/cuda_lib
    catboost/cuda/cuda_util
    catboost/cuda/data
    catboost/cuda/ctrs
    catboost/cuda/gpu_data
    catboost/libs/overfitting_detector
)

CUDA_NVCC_FLAGS(
    --expt-relaxed-constexpr
    -std=c++11
    -gencode arch=compute_35,code=sm_35
    -gencode arch=compute_52,code=sm_52
    -gencode arch=compute_60,code=sm_60
    -gencode arch=compute_61,code=sm_61
    -gencode arch=compute_61,code=compute_61
    --ptxas-options=-v
)

GENERATE_ENUM_SERIALIZATION(bootstrap.h)
GENERATE_ENUM_SERIALIZATION(score_function.h)

END()
