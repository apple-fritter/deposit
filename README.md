# android-cache.clear
## Introduction
There is a non-root method to clear the cache for all packages on an Android device and achieves this by using the `pm` command with the `clear` option, which clears the cache for the specified package.

To clear the cache for all packages, this script uses the `pm list packages -f command` to list all installed packages along with their file paths, and then pipes the output to the `awk` command to extract only the package names. Finally, it loops to through each package name through `pm clear` command.

This script is intended for use directly on the device to free up space on the fly.

## How it works
- `#!/bin/bash` specifies that the script should be run using the Bash shell.
- `for pkgname in $(pm list packages -f | awk -F= '{print $1}' | awk -F: '{print $NF}')`
uses a for loop to iterate over the list of installed packages on the device.
- `pm list packages -f` lists all installed packages and their file paths.
- `awk -F= '{print $1}'` extracts only the package name from each line of output by splitting the line on the equals sign and printing the first field.
- `awk -F: '{print $NF}'` extracts only the package name from each line of output by splitting the line on the colon character and printing the last field.
- `$(...)` syntax is used to capture the output of the command and pass it as a list of package names to the for loop.
- `do` begins the loop.
- `echo "Clearing cache for $pkgname"` prints a message to the console indicating which package's cache is being cleared.
- `pm clear "$pkgname"` uses the pm command to clear the cache for the current package.
- `done` ends the loop.

## Considerations:
Some apps may not allow clearing their cache from the command line. Also, clearing the cache for some system packages may cause issues with the device's performance, so use this script with caution.

## License

These files released under the [MIT License](LICENSE).
