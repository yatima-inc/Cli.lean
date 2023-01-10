import Lake
open Lake DSL

package Cli

@[default_target]
lean_lib Cli

require std from git
  "https://github.com/leanprover/std4/" @ "fde95b16907bf38ea3f310af406868fc6bcf48d1"

require YatimaStdLib from git
  "https://github.com/yatima-inc/YatimaStdLib.lean" @ "cf2da463e263951019cb96e74d5fa6e51636e553"
