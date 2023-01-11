import Lake
open Lake DSL

package Cli

@[default_target]
lean_lib Cli

require std from git
  "https://github.com/leanprover/std4/" @ "fde95b16907bf38ea3f310af406868fc6bcf48d1"

require YatimaStdLib from git
  "https://github.com/yatima-inc/YatimaStdLib.lean" @ "704823e421b333ea9960347e305c60f654618422"
