; ModuleID = 'saxpy.cu'
source_filename = "saxpy.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5"
target triple = "amdgcn-amd-amdhsa"

@gSyncThreadsFlag = dso_local local_unnamed_addr addrspace(3) global i32 undef, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define amdgpu_kernel void @_Z5saxpyfPfS_(float %0, float* nocapture readnone %1, float* nocapture readnone %2) local_unnamed_addr #0 !kernel_arg_addr_space !10 !kernel_arg_access_qual !11 !kernel_arg_type !12 !kernel_arg_base_type !12 !kernel_arg_type_qual !13 {
  %4 = tail call nonnull align 8 dereferenceable(24) i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr()
  %5 = bitcast i8 addrspace(4)* %4 to float addrspace(4)*
  %6 = load float, float addrspace(4)* %5, align 8, !invariant.load !14
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 8
  %8 = bitcast i8 addrspace(4)* %7 to float* addrspace(4)*
  %9 = load float*, float* addrspace(4)* %8, align 8, !invariant.load !14
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %4, i64 16
  %11 = bitcast i8 addrspace(4)* %10 to float* addrspace(4)*
  %12 = load float*, float* addrspace(4)* %11, align 8, !invariant.load !14
  %13 = load float, float* %9, align 4, !tbaa !15
  %14 = fmul contract float %6, %13
  %15 = load float, float* %12, align 4, !tbaa !15
  %16 = fadd contract float %14, %15
  %17 = getelementptr inbounds float, float* %9, i64 1
  %18 = load float, float* %17, align 4, !tbaa !15
  %19 = fadd contract float %16, %18
  %20 = getelementptr inbounds float, float* %12, i64 1
  %21 = load float, float* %20, align 4, !tbaa !15
  %22 = fmul contract float %19, %21
  %23 = fadd contract float %16, %19
  %24 = fadd contract float %23, %22
  %25 = getelementptr inbounds float, float* %12, i64 2
  store float %24, float* %25, align 4, !tbaa !15
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable
declare i8 addrspace(4)* @llvm.amdgcn.kernarg.segment.ptr() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx900" }
attributes #1 = { nofree nosync nounwind readnone speculatable }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!5}
!nvvm.annotations = !{!6, !7, !6, !8, !8, !8, !8, !9, !9, !8}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 12.0.0"}
!5 = !{i32 1, i32 2}
!6 = !{null, !"align", i32 8}
!7 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!8 = !{null, !"align", i32 16}
!9 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!10 = !{i32 0, i32 0, i32 0}
!11 = !{!"none", !"none", !"none"}
!12 = !{!"float", !"float*", !"float*"}
!13 = !{!"", !"", !""}
!14 = !{}
!15 = !{!16, !16, i64 0}
!16 = !{!"float", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C++ TBAA"}
