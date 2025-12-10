# Programming in 8086

Welcome to the **Programming in 8086** repository! This repository contains 8086 Assembly language programs and all the necessary tools to assemble and run them.

## 📚 Table of Contents

- [About](#about)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [How to Run Code in DOSBox](#how-to-run-code-in-dosbox)
- [Example: Running Hello World](#example-running-hello-world)
- [Common Commands](#common-commands)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 About

This repository is dedicated to 8086 Microprocessor Programming. It includes:
- Sample 8086 Assembly programs
- Assemblers and development tools (MASM, TASM, etc.)
- Instructions for setting up and running programs

## 📁 Repository Structure

```
Programming-in-8086/
├── Codes/          # Contains 8086 Assembly source files (.asm)
├── Assemblers/     # Contains assembler tools (MASM.EXE, TASM.EXE, LINK.EXE, etc.)
└── README.md       # This file
```

### Assemblers Directory

The `Assemblers/` directory contains the following tools:
- **MASM.EXE** - Microsoft Macro Assembler
- **TASM.EXE** - Turbo Assembler
- **LINK.EXE** - Linker to create executable files
- **EDIT.COM** - Text editor for DOS
- **TD.EXE** - Turbo Debugger
- **EXE2BIN.EXE** - Converts EXE files to binary format

## 🔧 Prerequisites

To run 8086 Assembly programs from this repository, you need:

1. **DOSBox** - An x86 emulator with DOS
   - Download from: [https://www.dosbox.com/](https://www.dosbox.com/)
   - Supports Windows, macOS, and Linux

## 💿 Installation

### Installing DOSBox

#### Windows
1. Download DOSBox from [https://www.dosbox.com/download.php?main=1](https://www.dosbox.com/download.php?main=1)
2. Run the installer and follow the installation wizard
3. Launch DOSBox from the Start Menu or Desktop shortcut

#### macOS
```bash
brew install dosbox
```
Or download the DMG file from the official website.

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install dosbox
```

#### Linux (Fedora)
```bash
sudo dnf install dosbox
```

## 🚀 How to Run Code in DOSBox

Follow these steps to assemble and run 8086 Assembly programs:

### Step 1: Start DOSBox
Launch DOSBox application on your system.

### Step 2: Mount the Repository Directory
In DOSBox, mount the repository directory as a virtual drive:

```dos
mount c /path/to/Programming-in-8086
```

**Example (Windows):**
```dos
mount c C:\Users\YourName\Programming-in-8086
```

**Example (macOS/Linux):**
```dos
mount c ~/Programming-in-8086
```

### Step 3: Switch to the Mounted Drive
```dos
c:
```

### Step 4: Navigate to Assemblers Directory
```dos
cd Assemblers
```

### Step 5: Assemble Your Code

Using **MASM** (Microsoft Macro Assembler):
```dos
MASM ..\Codes\Hello.asm;
```

Or using **TASM** (Turbo Assembler):
```dos
TASM ..\Codes\Hello.asm
```

This creates an object file (`.obj`).

### Step 6: Link the Object File
```dos
LINK ..\Codes\Hello.obj;
```

This creates an executable file (`.exe`).

### Step 7: Run the Executable
```dos
..\Codes\Hello.exe
```

## 📝 Example: Running Hello World

Here's a complete example of assembling and running the Hello World program:

```dos
# Start DOSBox and mount the directory
mount c C:\Users\YourName\Programming-in-8086
c:

# Navigate to Assemblers
cd Assemblers

# Assemble the program
MASM ..\Codes\Hello.asm;

# Link the object file
LINK ..\Codes\Hello.obj;

# Run the program
..\Codes\Hello.exe
```

**Expected Output:**
```
Hello, 8086 World!
```

## 📋 Common Commands

### Assembly Commands
- **Assemble with MASM:** `MASM filename.asm;`
- **Assemble with TASM:** `TASM filename.asm`
- **Link object file:** `LINK filename.obj;`
- **Run executable:** `filename.exe`

### DOSBox Commands
- **Mount drive:** `mount [drive-letter] [directory-path]`
- **Change drive:** `[drive-letter]:`
- **List files:** `dir`
- **Change directory:** `cd [directory-name]`
- **Clear screen:** `cls`
- **Exit DOSBox:** `exit`

### Debugging
To debug your program using Turbo Debugger:
```dos
TD ..\Codes\Hello.exe
```

## 🔍 Troubleshooting

### Common Issues

**Issue: "File not found" error**
- Solution: Ensure you've mounted the correct directory path
- Check that the file path is correct (use `dir` to list files)

**Issue: "Bad command or filename"**
- Solution: Make sure you're in the `Assemblers` directory where the tools are located
- Use `cd Assemblers` to navigate to the correct directory

**Issue: Assembly errors**
- Solution: Check your `.asm` file for syntax errors
- Ensure your code follows 8086 Assembly syntax
- Use the `EDIT` command to modify files in DOSBox

**Issue: DOSBox runs too fast or too slow**
- Solution: Adjust CPU cycles in DOSBox
- Press `Ctrl+F11` to slow down
- Press `Ctrl+F12` to speed up

## 🤝 Contributing

Contributions are welcome! If you have any 8086 Assembly programs you'd like to share:

1. Fork the repository
2. Add your `.asm` files to the `Codes/` directory
3. Ensure your code is well-commented
4. Submit a pull request

## 📚 Additional Resources

- [8086 Instruction Set Reference](https://en.wikipedia.org/wiki/X86_instruction_listings)
- [DOSBox Wiki](https://www.dosbox.com/wiki/)
- [8086 Assembly Tutorial](https://www.tutorialspoint.com/assembly_programming/)

## 📄 License

This repository is for educational purposes.

---

**Happy Coding! 🚀**
