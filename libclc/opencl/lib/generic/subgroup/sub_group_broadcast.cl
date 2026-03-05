//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "clc/subgroup/sub_group_broadcast.h"

#define CLC_SUB_GROUP_BROADCAST_IMPL(GENTYPE)                                  \
  _CLC_OVERLOAD _CLC_DEF _CLC_CONST GENTYPE sub_group_broadcast(               \
      GENTYPE x, uint sub_group_local_id) {                                    \
    return __clc_sub_group_broadcast(x, sub_group_local_id);                   \
  }

#define CLC_SUB_GROUP_BROADCAST_TYPES()                                        \
  CLC_SUB_GROUP_BROADCAST_IMPL(int)                                            \
  CLC_SUB_GROUP_BROADCAST_IMPL(uint)                                           \
  CLC_SUB_GROUP_BROADCAST_IMPL(long)                                           \
  CLC_SUB_GROUP_BROADCAST_IMPL(ulong)                                          \
  CLC_SUB_GROUP_BROADCAST_IMPL(float)

CLC_SUB_GROUP_BROADCAST_TYPES()

#ifdef cl_khr_fp16
CLC_SUB_GROUP_BROADCAST_IMPL(half)
#endif

#ifdef cl_khr_fp64
CLC_SUB_GROUP_BROADCAST_IMPL(double)
#endif
