import XMonad
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

main = xmonad defaultConfig
	{ terminal = "urxvt"
	, modMask = mod4Mask
	, layoutHook = smartBorders $ layoutHook defaultConfig
	, manageHook = myManageHooks
	 }

myManageHooks = composeAll
	[ isFullscreen --> doFullFloat
	]
