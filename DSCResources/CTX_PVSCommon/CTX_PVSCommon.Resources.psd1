﻿<# VE_XD7Common\VE_XD7Common.Resources.psd1 #>
ConvertFrom-StringData @'
    StartingProcess                     = Starting process '{0}' with arguments '{1}'.
    StartingProcessAs                   = Starting process with user credential '{0}'.
    ProcessLaunched                     = Process Id '{0}' launched.
    WaitingForProcessToExit             = Waiting for process Id '{0}' to exit..
    ProcessExited                       = Process Id '{0}' exited with code '{1}'.
    XenDesktopSDKNotFoundError          = Citrix XenDesktop 7.x Powershell SDK/Snap-in was not found.
    NoValidSetupMediaError              = No valid '{0}' setup media found in path '{1}'.
    MachineNotFoundError                = Citrix XenDesktop 7.x machine name '{0}' was not found.
    AmbiguousMachineReferenceError      = Citrix XenDesktop 7.x machine reference '{0}' is ambiguous. Specify the machine's FQDN.
    MachineNameNotFullyQualifiedWarning = The Citrix XenDesktop 7.x machine reference '{0}' is not fully qualified. Specify the machine's FQDN to avoid any ambiguity.
    MissingMachineReference             = Citrix XenDesktop 7.x machine '{0}' is missing and should be added.
    SurplusMachineReference             = Citrix XenDesktop 7.x machine '{0}' is surplus and should be removed.
    InvokingScriptBlockWithParams       = Invoking script block with parameters: '{0}'.
'@
