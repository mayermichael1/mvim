# Minimal Neovim configuration

## User Guide, Tips and Tricks

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

As snippets are defined as abbreviations they can be viewed with following
command:

```
:abbrev
```

### Keymaps

These commands may be used to see configured mappings:

```
:map
:verbose map
:map <beginning>
```

### Project Local Settings

If enabled Neovim searches for a local `.nvim.lua` file in the current directory
before opening up.

### Spell Checking

Enable spell checking:

```
:set spell spelllang=<langcode>
```

A missspelled word can be checked with `z=`. 
The commands `]s` and `[s` may be used to navigate to the next or previous 
spelling error.

Other languages than "en" need a spelling file *.spl in `/home/$USER/.local/share/nvim/site/spell`.
These files should be downloaded automatically. This however does not work.
These files can be downloaded from: [Spell File FTP](https://ftp.nluug.nl/vim/runtime/spell)

### Folds

To create a toggle:

```
zf{motion}

//create fold for whole function
zfa}
```

To open and close fold:

```
za
```

### Filename Registers

The register `%` contains the current's file name. The register `#` contains
the last opened file name.

Example: pasting current filename to the buffer
```
"%p
```

Example: Full filename to the buffer
```
:let @" = expand("%")
p
```

### Quickfix List

Open a quickfix list: `:copen` or `:cwindow`.
All Telescope searches can be turned into quickfix lists by pressing 'C-q'.
Commmands like `:vimgrep`,`:grep` or`:make` will also result in a quickfix.

### Inserting in Command or Insert Mode

With `CTRL-R{register}` like `CTRL-R 0` the specified register can be inserted 
into the current buffer or command line in command or insert mode.

### Current Working Directory

Print current working directory:

```
:pwd
```

change the current working directory:

```
:cd <directory>
```

change the current working directory to the directory containing the file:

```
:cd %:p:h
```

### UPPER and lower case

In visual mode press `u` to lower case the visual selection and `U` to upper case 
the selection;

### Incrementing Numbers

`CTRL-A` and `CTRL-X` can be used to increment a decrement the number under the 
current cursor.

Following command can be used to create following example:
```
0
0
0
0
0
->
1
2
3
4
5
```

visually select all the lines then `gCTRL-A`.

### execute normal mode commands for selection

`norm[al]` can be used to execute normal mode commands for a specific selection.

Examples:

```
:% norm! @a 
```

Execute macro a on all lines of the current buffer.

```
:'<,'> norm! @a
```

Execute macro a on all lines in the visual selection.

```
:g/pattern/ norm! @a
```

Executre macrr a on all lines matching pattern.

### Reformatting Text to a specified textwidth

When a text is visually selected use:
```
gq
```

## TODO 

Following points should still be improved upon.

- [ ] Terminal handling for various tasks like git and running a program
- [ ] maybe implement a git integration in some way
- [ ] customize the status line :help 'statusline
- [ ] customize syntax files for certain languages
- [ ] spell lang per document or project
- [ ] some tex files to not load syntax correctly on first load `:syntax on`re-enables this 
- [ ] show code - hierarchie in status line should be doable with some {{ matching
- [ ] many spelling mistakes notably slows down the editor. Maybe disable
  spellchecking when to many errors occur

### C programming

- [ ] ctags
- [ ] TermDebug package for gdb integration

