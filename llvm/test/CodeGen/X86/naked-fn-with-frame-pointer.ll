; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 5
; RUN: llc < %s -mtriple i386 | FileCheck %s -check-prefixes=CHECK-32
; RUN: llc < %s -mtriple x86_64 | FileCheck %s -check-prefixes=CHECK-64

declare dso_local void @main()

define dso_local void @naked() naked "frame-pointer"="all" {
; CHECK-32-LABEL: naked:
; CHECK-32:       # %bb.0:
; CHECK-32-NEXT:    calll main
;
; CHECK-64-LABEL: naked:
; CHECK-64:       # %bb.0:
; CHECK-64-NEXT:    callq main
  call void @main()
  unreachable
}

define dso_local void @normal() "frame-pointer"="all" {
; CHECK-32-LABEL: normal:
; CHECK-32:       # %bb.0:
; CHECK-32-NEXT:    pushl %ebp
; CHECK-32-NEXT:    .cfi_def_cfa_offset 8
; CHECK-32-NEXT:    .cfi_offset %ebp, -8
; CHECK-32-NEXT:    movl %esp, %ebp
; CHECK-32-NEXT:    .cfi_def_cfa_register %ebp
; CHECK-32-NEXT:    calll main
;
; CHECK-64-LABEL: normal:
; CHECK-64:       # %bb.0:
; CHECK-64-NEXT:    pushq %rbp
; CHECK-64-NEXT:    .cfi_def_cfa_offset 16
; CHECK-64-NEXT:    .cfi_offset %rbp, -16
; CHECK-64-NEXT:    movq %rsp, %rbp
; CHECK-64-NEXT:    .cfi_def_cfa_register %rbp
; CHECK-64-NEXT:    callq main
  call void @main()
  unreachable
}
