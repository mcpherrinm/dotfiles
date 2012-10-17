import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders

--main = xmonad defaultConfig
--	{ terminal = "urxvt"
--	, modMask = mod4Mask
--	, layoutHook = smartBorders $ layoutHook defaultConfig
--	, manageHook = myManageHooks
--	 }

main = xmonad xfceConfig

--myManageHooks = composeAll
--	[ isFullscreen --> doFullFloat
--	]
