# deposit
If you're running low on storage space on your Android device, clearing the cache for your installed apps can be a quick and easy way to free up some room. However, clearing the cache for each app individually can be a tedious and time-consuming process. Fortunately, there's a non-root method to clear the cache for all packages on your device using a simple `Bash` script.

The script uses the `pm` command with the clear option to clear the cache for each package. To automate the process, the script first lists all installed packages along with their file paths using `pm list packages -f`, and then extracts only the package names using `awk`. By looping through each package name and running `pm clear`, the script can clear the cache for all installed apps with a single action.

Since this script is designed to be used directly on the device, it's a convenient way to free up space on the fly without needing to connect to a computer or root your device.

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

## [Disclaimer](DISCLAIMER)
**This software is provided "as is" and without warranty of any kind**, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.

**The authors do not endorse or support any harmful or malicious activities** that may be carried out with the software. It is the user's responsibility to ensure that their use of the software complies with all applicable laws and regulations.

## License

These files released under the [MIT License](LICENSE).
