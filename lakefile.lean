import Lake
open Lake DSL

package Cli

@[default_target]
lean_lib Cli {
  srcDir := "src"
}

require std from git
  "https://github.com/leanprover/std4/" @ "fde95b16907bf38ea3f310af406868fc6bcf48d1"

require YatimaStdLib from git
  "https://github.com/lurk-lab/YatimaStdLib.lean" @ "649368d593f292227ab39b9fd08f6a448770dca8"
