import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

main = xmonad defaultConfig
	{ terminal = "gnome-terminal"
	, modMask = mod4Mask
	, layoutHook = smartBorders $ layoutHook defaultConfig
	, manageHook = myManageHooks
	 }

myManageHooks = composeAll
	[ isFullscreen --> doFullFloat
	]
