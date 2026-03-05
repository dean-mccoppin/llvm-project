//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "clc/subgroup/sub_group_broadcast.h"

_CLC_DEF _CLC_OVERLOAD _CLC_CONST uint
__clc_sub_group_broadcast(uint x, uint sub_group_local_id) {
  uint j = __builtin_amdgcn_readfirstlane(sub_group_local_id);
  return __builtin_amdgcn_readlane(x, j);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST ulong
__clc_sub_group_broadcast(ulong x, uint sub_group_local_id) {
  uint j = __builtin_amdgcn_readfirstlane(sub_group_local_id);
  uint2 as_vec = __builtin_astype(x, uint2);
  as_vec.x = __builtin_amdgcn_readlane(as_vec.x, j);
  as_vec.y = __builtin_amdgcn_readlane(as_vec.y, j);
  return __builtin_astype(as_vec, ulong);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST int
__clc_sub_group_broadcast(int x, uint sub_group_local_id) {
  return (int)__clc_sub_group_broadcast((uint)x, sub_group_local_id);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST float
__clc_sub_group_broadcast(float x, uint sub_group_local_id) {
  uint broadcast =
      __clc_sub_group_broadcast(__builtin_astype(x, uint), sub_group_local_id);
  return __builtin_astype(broadcast, float);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST long
__clc_sub_group_broadcast(long x, uint sub_group_local_id) {
  return (long)__clc_sub_group_broadcast((ulong)x, sub_group_local_id);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST double
__clc_sub_group_broadcast(double x, uint sub_group_local_id) {
  uint bitcast = __builtin_astype(x, double);
  ulong broadcast = __clc_sub_group_broadcast(bitcast, sub_group_local_id);
  return __builtin_astype(broadcast, double);
}

_CLC_DEF _CLC_OVERLOAD _CLC_CONST half
__clc_sub_group_broadcast(half x, uint sub_group_local_id) {
  ushort bitcast = __builtin_astype(x, ushort);
  uint broadcast = __clc_sub_group_broadcast((uint)bitcast, sub_group_local_id);
  return __builtin_astype((ushort)broadcast, half);
}
