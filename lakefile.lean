import Lake
open Lake DSL

package Cli

@[default_target]
lean_lib Cli

require std from git
  "https://github.com/leanprover/std4/" @ "2919713bde15d55e3ea3625a03546531283bcb54"

require YatimaStdLib from git
  "https://github.com/yatima-inc/YatimaStdLib.lean" @ "704823e421b333ea9960347e305c60f654618422"
