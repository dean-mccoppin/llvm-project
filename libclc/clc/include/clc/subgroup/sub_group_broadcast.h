//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef __CLC_SUBGROUP_CLC_SUB_GROUP_BROADCAST_H__
#define __CLC_SUBGROUP_CLC_SUB_GROUP_BROADCAST_H__

#include <clc/clcfunc.h>

_CLC_DECL _CLC_OVERLOAD _CLC_CONST int
__clc_sub_group_broadcast(int x, uint sub_group_local_id);

_CLC_DECL _CLC_OVERLOAD _CLC_CONST uint
__clc_sub_group_broadcast(uint x, uint sub_group_local_id);

_CLC_DECL _CLC_OVERLOAD _CLC_CONST long
__clc_sub_group_broadcast(long x, uint sub_group_local_id);

_CLC_DECL _CLC_OVERLOAD _CLC_CONST ulong
__clc_sub_group_broadcast(ulong x, uint sub_group_local_id);

#ifdef cl_khr_fp16
#pragma OPENCL EXTENSION cl_khr_fp16 : enable

_CLC_DECL _CLC_OVERLOAD _CLC_CONST half
__clc_sub_group_broadcast(half x, uint sub_group_local_id);
#endif

_CLC_DECL _CLC_OVERLOAD _CLC_CONST float
__clc_sub_group_broadcast(float x, uint sub_group_local_id);

#ifdef cl_khr_fp64
#pragma OPENCL EXTENSION cl_khr_fp64 : enable

_CLC_DECL _CLC_OVERLOAD _CLC_CONST double
__clc_sub_group_broadcast(double x, uint sub_group_local_id);
#endif

#endif // __CLC_SUBGROUP_CLC_SUB_GROUP_BROADCAST_H__
