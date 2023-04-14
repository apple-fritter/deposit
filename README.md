# android-cache.clear
There is a non-root method to clear the cache for all packages on an Android device and achieves this by using the `pm` command with the `clear` option, which clears the cache for the specified package.

To clear the cache for all packages, this script uses the `pm list packages -f command` to list all installed packages along with their file paths, and then pipes the output to the `awk` command to extract only the package names. Finally, it loops to through each package name through `pm clear` command.

This script is intended for use directly on the device to free up space on the fly.

## Considerations:
Some apps may not allow clearing their cache from the command line. Also, clearing the cache for some system packages may cause issues with the device's performance, so use this script with caution.
