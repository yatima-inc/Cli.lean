import Lake
open Lake DSL

package Cli

@[default_target]
lean_lib Cli

require std from git
  "https://github.com/leanprover/std4/" @ "v4.4.0"

require YatimaStdLib from git
  "https://github.com/lurk-lab/YatimaStdLib.lean" @ "3037f0c14128751b95510c2723f067ec7a494f08"
