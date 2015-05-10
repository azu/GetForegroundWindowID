# GetForegroundWindowID

Mac OS X command line utility to retrieve the CGWindowID of the foreground window (useful for screencapture).

## Usage

```sh
./GetForegroundWindowID
```

For example:

use it to capture a specific window:

```sh
screencapture -l$(./GetForegroundWindowID) ForegroundWindoW.png
```

## Thanks

- [smokris/GetWindowID](https://github.com/smokris/GetWindowID "smokris/GetWindowID")
- https://github.com/sdsykes/Change-Space/blob/e4b683c0dd2d69733de8257fb9b994ceae1073b8/ChangeSpace/spaces.c#L49