# ARM6Support
ARM610 support module for RISC OS 3.1.

This is intended for Archimedes machines with experimental ARM610 CPU board.
It will report an error if it is loaded on a system with the wrong CPU.

The source are supplied in BBC BASIC Textual format (filetype &FD1), so that
they can be stored efficiently in Git and viewed online.

# How to build

The module can be built on RISC OS itself, and from Linux.
The sources create a module called `ARM6Support`, in the file `ARM6SUPP`.

## On RISC OS

On RISC OS the sources can be built with BBC BASIC directly. Use:

```
*BASIC -quit ARM6Src
```

## On Linux

On Linux the sources can be built by submitting to the build service. Use:

```
./test-build.sh
```

# Version history
* 0.01 - Basic MMU initialisation (identity mapping for first 64 MB)
