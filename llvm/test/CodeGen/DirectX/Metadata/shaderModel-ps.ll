; RUN: opt -S -dxil-translate-metadata %s | FileCheck %s
target triple = "dxil-pc-shadermodel5.0-pixel"

; CHECK: !dx.shaderModel = !{![[SM:[0-9]+]]}
; CHECK: ![[SM]] = !{!"ps", i32 5, i32 0}

define void @entry() #0 {
entry:
  ret void
}

attributes #0 = { noinline nounwind "hlsl.shader"="pixel" }
