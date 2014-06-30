# compile xomnad.hs to a binary
xmonad --recompile

# restart xmonad with new config
xmonad --restart

import XMonad.Layout.PerWorkspace
-- then in layoutHook:
onWorkspace "float" simpleFloat
