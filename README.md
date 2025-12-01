# en_to_ar_fixer
- An AutoHotkey script that instantly converts text typed in the English layout into the correct Arabic characters. Fixes 'lpl]' to 'محمد' without retyping.

##  Installation
1.  Download and install **AutoHotkey v1** (Classic Version) from the official website. This script **will not work** with AutoHotkey v2.
2.  Download the `.ahk` file from this repository.
3.  Double-click the file to run it.

## Important Note: Administrator Privileges
If you are using this script to correct text inside an application that is running with Administrator privileges (like certain professional IDEs, system utilities, or even programs like Excel/Word if they were opened using "Run as administrator"), the script will not be able to interact with that application.

- This is a security feature of Windows to prevent lower-level programs from controlling higher-level programs.
- The Fix: To ensure the AutoHotkey script works within an elevated application, you must launch the .ahk file itself with Administrator privileges.
- How to Run as Admin: Right-click your .ahk script file and select "Run as administrator."
