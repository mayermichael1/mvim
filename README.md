# Minimal Neovim configuration

## User Guide

### Searching for Files

```
:fin[d] <filename>
```

This command can be tab-completed.

### Searching for text in files

```
:grep <searchterm>
```

### Snippets 

Snippets for certain languages are defined in `./after/ftplugin/`.
A snippet can be expanded in insert mode with `<c-]>`. 
Defined hooks can be navigated with `<tab>`.

## Todos

Following points should still be improved upon.

- [ ] Terminal handling for various tasks like git and running a program
- [ ] maybe implement a git integration in some way
- [ ] customize the status line :help 'statusline'
- [ ] customize syntax files for certain languages

### C programming

- [ ] ctags
- [ ] TermDebug package for gdb integration

